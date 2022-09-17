import { getUser} from "./scripts/fetchUtils.js";
import { createPoseCanvas, initGame } from "./scripts/utils.js";

$(async () => {
  var id1 = sessionStorage.getItem("id1");
  var id2 = sessionStorage.getItem("id2");
  const userlist1 = await getUser(id1);
  const userlist2 = await getUser(id2);
  document.getElementById("p1").innerHTML = userlist1.name;
  document.getElementById("p2").innerHTML = userlist2.name;
  const canvas = document.getElementById("camCanvas");
  const video = $("#video").get(0);
  const webcam = new Webcam(video, "user");
  await webcam.stream();

  let context = canvas.getContext("2d");
  context.drawImage(video, 0, 0, 1024, 1024);
  const snap = canvas.toDataURL();
  sessionStorage.setItem("screen", snap);

 
  const camCanvas1 = createPoseCanvas($("#camCanvas1").get(0));
  const imgCanvas = createPoseCanvas($("#imgCanvas").get(0));

  
  
  const queryParams = new URLSearchParams(window.location.search);

  const levelId = queryParams.get("id");


  initGame(levelId, video, camCanvas1, imgCanvas, id1, id2);
});

