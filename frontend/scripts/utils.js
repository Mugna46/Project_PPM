import { Config } from "./config.js";
import { getLevel, getPicture, getUser, postScore, getnPlayers } from "./fetchUtils.js";

//Variabili score che devono essere globali
let score1 = 0;
let score2 = 0;
let position = 0;

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

export const startTimer = async (user1_id, user2_id, minutes = 1, seconds = 0, bool = true) => {

  setInterval(async function () {
    if (bool == true) {
      seconds--;
      if (seconds == -1) {
      } else if (seconds < 10) {
        document.getElementById("seconds").innerHTML = "0" + seconds;
      } else {
        document.getElementById("seconds").innerHTML = seconds;
      }
      if (seconds < 0) {
        minutes--;
        document.getElementById("minutes").innerHTML = minutes + ":";
        seconds = 59;
        document.getElementById("seconds").innerHTML = 59;
      }
      //finisce timer
      if (minutes == 0 && seconds == 0) {

        const user1 = await getUser(user1_id);
        const user2 = await getUser(user2_id);
        var old_score1 = user1.score;
        var old_score2 = user2.score;
        if (score1 > old_score1) {
          postScore(user1_id, score1);
        }
        if (score2 > old_score2) {
          postScore(user2_id, score2);
        }
        var tie = false;
        alert("The time is over!")
        //Mettere nel database gli score dei giocatori 
        //con eventuale controllo se score >= di quello precedente
        if (score1 > score2) {
          sessionStorage.setItem("id", user1_id)
          sessionStorage.setItem("score", score1);
          sessionStorage.setItem("tie", tie)
        } else if (score1 == score2) {
          tie = true;
          sessionStorage.setItem("tie", tie)
        } else {
          sessionStorage.setItem("id", user2_id)
          sessionStorage.setItem("score", score2);
          sessionStorage.setItem("tie", tie)
        }
        location.href = "end.html"
        bool = false;
      }
    }
  }, 1000)
}

export const addElement = async () => {
  let listname = document.getElementById("playerlistname")
  let listscore = document.getElementById("playerlistscore")
  let num = await getnPlayers();
  const ordered = [];
  for (let i = 0; i < num.length; i++) {
    ordered[i] = {
      user: num[i][2],
      score: num[i][4]
    };
  }
  ordered.sort(function (x, y) {
    return y.score - x.score;
  });
  for (let i = 0; i < ordered.length; i++) {
    var entryname = document.createElement("li");
    entryname.className = "list-group-item";
    var entryscore = document.createElement("li");
    entryscore.className = "list-group-item";
    if(position < 3){
      entryname.id = "podium";
      entryscore.id = "podium";
    }
    position++;
    entryname.appendChild(document.createTextNode(ordered[i].user));
    entryscore.appendChild(document.createTextNode(ordered[i].score));
    listname.appendChild(entryname);
    listscore.appendChild(entryscore);
  }
}


export const initGame = async (levelId, video, camCanvas1, imgCanvas, user1_id, user2_id) => {
  $("#main").hide();
  const level = await getLevel(levelId);
  addElement();


  //Variabili per la gestione di round e punteggi
  let id1;
  let id2;
  let round = 0;
  let count_match = 0;
  let i = 0;
  const pictures_Array = new Array(); //Array delle immagini
  var start_timer = true;

  document.getElementById("nround").innerHTML = round;

  // crea array per scorrere le immagini
  for (let i = 0; i < level.picture_ids.length; i++) {
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
      document.getElementById("s1").innerHTML = score1;
      // secondo counter
      document.getElementById("s2").innerHTML = score2;

      if (Config.DEBUG) {
        //gestione debug per più persone contemporaneamente
        for (let i = 0; i < filteredVideoKPs.length; i++) {
          camCanvas1.drawSkeleton({ keypoints: filteredVideoKPs[i].lista });
        }
      }
      for (let i = 0; i < computedDistance.length; i++) {
        if (imgQueue.isFull() && 1 - computedDistance[i].score > Config.MATCH_LEVEL) {
          clearInterval(gameLoop);

          //condizioni per incrementare il punteggio dei giocatori (entra neli corrispettivi if dalla terza posa)
          if (count_match > 1 && id1 == computedDistance[i].id) {
            score1++;
          }
          if (count_match > 1 && id2 == computedDistance[i].id) {
            score2++;
          }

          // distinzione dei due giocatori, prova
          if (count_match === 0) {// distinzione giocatore1
            id1 = computedDistance[i].id;
            count_match++;
            round--;
            //stampa round su console (per debug)
            //console.log(round);
          } else if (count_match === 1) {// distinzione giocatore 2
            for (let j = 0; j < computedDistance.length; j++) { //CAMBIARE I CON J
              if (computedDistance[i].id != id1) {
                id2 = computedDistance[i].id;
              }
            }
            count_match++;
            //round--;

          }

          round++;
          document.getElementById("nround").innerHTML = round;

          if (start_timer == true && round > 0) {
            startTimer(user1_id, user2_id);
            start_timer = false;
          }


          // incremento punteggi (entra nel if solo dopo le prime due pose per registrare id dei giocatori)

          document.getElementById("s1").innerHTML = score1;
          document.getElementById("s2").innerHTML = score2;
          imgQueue.clear();
          // non esce dal ciclo ma da gestire attraverso timer
          // adesso dovrebbe uscire comunque da cambiare
          await nextRound();
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

