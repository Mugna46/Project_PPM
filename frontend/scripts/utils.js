import { Config } from "./config.js";
import { getLevel, getPicture, postVideo } from "./fetchUtils.js";

export const createPoseDistanceFrom = (keypointsA = []) => {
  const [avgXA, avgYA] = keypointsA
    .reduce(([sumX, sumY], kpA) => [sumX + kpA.x, sumY + kpA.y], [0, 0])
    .map((sum) => sum / keypointsA.length);

  return (keypointsB = []) => {
    const count = keypointsA.reduce((res, kpA) => {
      if (keypointsB.find((kpB) => kpA.name === kpB.name)) {
        return res + 1;
      }
      return res;
    }, 0);
    if (count < keypointsA.length / 2) {
      return 1;
    }
    const [avgXB, avgYB] = keypointsB
      .reduce(([sumX, sumY], kpB) => [sumX + kpB.x, sumY + kpB.y], [0, 0])
      .map((res) => res / keypointsB.length);

    return Math.sqrt(
      keypointsA.reduce((res, kpA) => {
        const kpB = keypointsB.find((kpB) => kpA.name === kpB.name);
        if (!kpB) {
          return res + 1; //1 è la distanza massima che si può raggiungere
        }
        const relativeDistanceXA = kpA.x - avgXA;
        const relativeDistanceXB = kpB.x - avgXB;
        const relativeDistanceYA = kpA.y - avgYA;
        const relativeDistanceYB = kpB.y - avgYB;
        const spaceDistance = Math.sqrt(
          Math.pow(relativeDistanceXA - relativeDistanceXB, 2) + Math.pow(relativeDistanceYA - relativeDistanceYB, 2)
        );
        return res + spaceDistance;
      }, 0) / keypointsA.length
    );
  };
};

export const createPoseCanvas = (canvas) => {
  canvas.width = Config.WIDTH;
  canvas.height = Config.HEIGHT;
  const ctx = canvas.getContext("2d");
  const drawPoint = ({ x, y, r, color = "white" }) => {
    ctx.beginPath();
    ctx.arc(x * canvas.width, y * canvas.width, r, 0, 2 * Math.PI);
    ctx.fillStyle = color;
    ctx.fill();
  };
  const drawSegment = ({ pointA, pointB, color = "white" }) => {
    if (pointA && pointB) {
      ctx.beginPath();
      ctx.moveTo(pointA.x * canvas.width, pointA.y * canvas.width);
      ctx.lineTo(pointB.x * canvas.width, pointB.y * canvas.width);
      ctx.lineWidth = 2;
      ctx.strokeStyle = color;
      ctx.stroke();
    }
  };
  return {
    canvas,
    drawPoint,
    drawSegment,
    drawImage: (img) => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      ctx.save();
      ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
      ctx.restore();
    },
    drawSkeleton: ({ keypoints, color = "white" }) => {
      const adjacentKeyPoints = [
        ["nose", "left_eye"],
        ["nose", "right_eye"],
        ["left_eye", "left_ear"],
        ["right_eye", "right_ear"],
        ["left_shoulder", "right_shoulder"],
        ["left_shoulder", "left_elbow"],
        ["left_elbow", "left_wrist"],
        ["right_shoulder", "right_elbow"],
        ["right_elbow", "right_wrist"],
        ["left_shoulder", "left_hip"],
        ["right_shoulder", "right_hip"],
        ["left_hip", "right_hip"],
        ["left_hip", "left_knee"],
        ["left_knee", "left_ankle"],
        ["right_hip", "right_knee"],
        ["right_knee", "right_ankle"],
      ];
      keypoints.forEach(({ x, y }) => {
        drawPoint({ x, y, r: 6 });
      });
      adjacentKeyPoints.forEach(([first, second]) => {
        drawSegment({
          pointA: keypoints.find(({ name }) => name === first),
          pointB: keypoints.find(({ name }) => name === second),
          color,
        });
      });
    },
  };
};

export const createImage = (src) =>
  new Promise((resolve, reject) => {
    const img = new Image();
    img.onload = () => resolve(img);
    img.onerror = reject;
    img.crossOrigin = "anonymous";
    img.src = src;
  });

// aggiunti id per gestire dubeg e id di tutti
export const normalizeKPs = (poses, i, width, height) =>
  (poses?.[i]?.keypoints || [])
    .filter((kp) => kp.score > 0.3)
    .map(({ x, y, score, name }) => ({
      x: x / width,
      y: y / height,
      score,
      name,
    }));

export const createPictureLoader = async (imgCanvas) => {
  const strongDetector = await poseDetection.createDetector(poseDetection.SupportedModels.MoveNet, {
    modelType: poseDetection.movenet.modelType.SINGLEPOSE_THUNDER,
  });

  return async (id) => {
    const picture = await getPicture(id);
    const img = await createImage(`${Config.SERVER_URL}${picture.path}`);
    const imagePoses = await strongDetector.estimatePoses(img);
    const imageKPs = normalizeKPs(imagePoses, 0, img.width, img.height);
    const imageKPNames = imageKPs.map((kp) => kp.name);
    imgCanvas.drawImage(img);
    if (Config.DEBUG) {
      imgCanvas.drawSkeleton({ keypoints: imageKPs });
    }
    const distanceFromImg = createPoseDistanceFrom(imageKPs);

    return {
      imageKPNames,
      distanceFromImg,
    };
  };
};

const queueGenerator = (size) => {
  let queue = [];
  return {
    queue,
    enqueue: (item) => {
      if (queue.length === size) {
        queue.splice(0, 1);
      }
      queue.push(item);
    },
    dequeue: () => {
      queue.splice(0, 1);
    },
    clear: () => {
      queue = [];
    },
    isFull: () => queue.length === size,
  };
};

export const initGame = async (levelId, video, camCanvas1, imgCanvas, id1, id2) => {
  $("#main").hide();
  const level = await getLevel(levelId);

  let round = 0;
  let count_match = 0; 
  let count1 = 0;
  let count2 = 0;
  let i = 0;
  const pictures_Array = new Array(); //Array delle immagini
  
  //stampa su console il numero di immagini nel database locale (per debug)
  console.log(level.picture_ids.length)
  for(let i=0;i<level.picture_ids.length;i++){
    pictures_Array.push(i);
  }
  
  const detectorConfig = {
    modelType: poseDetection.movenet.modelType.MULTIPOSE_LIGHTNING,
  };
  const detector = await poseDetection.createDetector(poseDetection.SupportedModels.MoveNet, detectorConfig);
  const pictureLoad = await createPictureLoader(imgCanvas);

  const userVideoList = [];

  const nextRound = async () => {
    //Scelgo numero random per dare immagine random al round successivo 
    
    const id = level.picture_ids[pictures_Array[i]];
    i++;

    const { imageKPNames, distanceFromImg } = await pictureLoad(id);

    const imgQueue = queueGenerator(Config.VIDEO_SECONDS * Config.FRAME_RATE);

    const videoKPs = [];
    const filteredVideoKPs = [];
    const computedDistance = [];

    const gameLoop = setInterval(async () => {
      $("#game-loading").remove();
      $("#main").show();

      const videoPoses = await detector.estimatePoses(video);
      // length 2
      // cicli for per gestire più persone all'interno del codice
      for (let i = 0; i < videoPoses.length; i++) {
        videoKPs[i] = {
          lista: normalizeKPs(videoPoses, i, 620, 480),
          id: videoPoses[i].id
        }
        filteredVideoKPs[i] = {
          lista: videoKPs[i].lista.filter((kp) => imageKPNames.includes(kp.name)),
          id: videoKPs[i].id
        }
        computedDistance[i] = {
          score: distanceFromImg(filteredVideoKPs[i].lista),
          id: filteredVideoKPs[i].id
        }
      }

      const computedDistancePercentage = Math.min(99, ((1 - computedDistance) / Config.MATCH_LEVEL) * 100).toFixed(0);

      $("#score").width(`${computedDistancePercentage}%`);
      $("#score").text(`${computedDistancePercentage}%`);

      camCanvas1.drawImage(video);
      document.getElementById("s1").innerHTML = count1;
      // secondo counter
      document.getElementById("s2").innerHTML = count2;
      
      if (Config.DEBUG) {
        //gestione debug per più persone contemporaneamente
        for(let i=0; i<filteredVideoKPs.length; i++){
        camCanvas1.drawSkeleton({ keypoints: filteredVideoKPs[i].lista });
        }
      }
      for (let i = 0; i < computedDistance.length; i++) {
        if (imgQueue.isFull() && 1 - computedDistance[i].score > Config.MATCH_LEVEL) {
          clearInterval(gameLoop);
          // distinzione dei due giocatori, prova
          if (count_match === 0){// distinzione giocatore1
             id1 = computedDistance[i].id;
             count_match++;
             round--;
             //stampa round su console (per debug)
             console.log(round);
          }else if(count_match === 1){// distinzione giocatore 2
            for(let i=0; i<computedDistance.length; i++){
              if(computedDistance[i].id != id1){
                id2 = computedDistance[i].id;
              }
            }
            count_match++;
            round--;
             //stampa round su console (per debug)            
            console.log(round);
            console.log("round");
          }
          
          round++;
          console.log(round);
          // incremento punteggi (entra nel if solo dopo le prime due pose per registrare id dei giocatori)
          if (count_match > 1 && id1 == computedDistance[i].id ){
            count1++;
          }
          if (count_match > 1 && id2 == computedDistance[i].id ){
            count2++;
          }
          document.getElementById("s1").innerHTML = count1;
          document.getElementById("s2").innerHTML = count2;
          imgQueue.clear();
          // non esce dal ciclo ma da gestire attraverso timer
          // adesso dovrebbe uscire comunque da cambiare 
          if (round < pictures_Array.length) {
            await nextRound();
          } else {
            const formData = new FormData();
            level.picture_ids.forEach((pictureId) => {
              formData.append("picture_ids[]", pictureId);
            });
            userVideoList.forEach(({ id, frameList }) => {
              frameList.forEach((frame, j) => {
                formData.append(`frames_${id}[]`, frame, `frame_${id}_${j}.jpg`);
              });
            });
            try {
              const video = await postVideo(formData);
              location.href = `end.html?id=${video.id}`;
            } catch (e) {
              console.error(e);
              location.href = `end.html`;
            }
          }
        }
      }

      const base64image = camCanvas1.canvas.toDataURL("image/jpeg", 0.2);
      const response = await fetch(base64image);
      const imageBlob = await response.blob();
      imgQueue.enqueue(imageBlob);
    }, 1000 / Config.FRAME_RATE);

    return gameLoop;
  };

  return nextRound();
};

