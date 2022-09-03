import { getUser } from "./scripts/fetchUtils.js";
import { createPoseCanvas, initGame } from "./scripts/utils.js";

$(async () => {
  var id1 = sessionStorage.getItem("id1");
  var id2 = sessionStorage.getItem("id2");
  const userlist1 = await getUser(id1);
  const userlist2 = await getUser(id2);
  document.getElementById("p1").innerHTML = userlist1.name;
  document.getElementById("p2").innerHTML = userlist2.name;
  const video = document.getElementById("video");
  const webcam = new Webcam(video, "user");
  webcam.stream();
  const camCanvas1 = createPoseCanvas($("#camCanvas1").get(0));
  const imgCanvas = createPoseCanvas($("#imgCanvas").get(0));

  
  
  const queryParams = new URLSearchParams(window.location.search);

  const levelId = queryParams.get("id");

  initGame(levelId, video, camCanvas1, imgCanvas);

  //Codice per il timer
  var minutes = 5;
  var seconds = 0;
  var timestart = false;
  document.getElementById("start-button").onclick = function() {start()};
  
  function start(){
    
    document.getElementById("start-button").innerHTML = "Let's go!";
    timestart = true;

    setInterval(function(){
      if(timestart == true){
        seconds--;
        if(seconds==-1){
          
        }else if(seconds < 10){
          document.getElementById("seconds").innerHTML = "0"+seconds ;
        }else{
          document.getElementById("seconds").innerHTML = seconds;
        }

        if(seconds < 0){
          minutes--;
          document.getElementById("minutes").innerHTML = minutes+":";
          seconds = 59;
          document.getElementById("seconds").innerHTML = 59;
        }

      }
  
      if(minutes==0 && seconds==0){
        if(timestart ==true){
           alert("The time is over!")
           location.href= "end.html"
        }
        timestart = false;
      }

    },1000)
  } 
});

