import { getUser} from "./scripts/fetchUtils.js";
import { createPoseCanvas, initGame } from "./scripts/utils.js";

$(async () => {
  var id1 = sessionStorage.getItem("id1");
  var id2 = sessionStorage.getItem("id2");
  const userlist1 = await getUser(id1);
  const userlist2 = await getUser(id2);
  document.getElementById("p1").innerHTML = userlist1.name;
  document.getElementById("p2").innerHTML = userlist2.name;
  let canvas = document.createElement("canvas")
  canvas.width=1024;
  canvas.height=1024;
  const video = $("#video").get(0);
  const webcam = new Webcam(video, "user");
  await webcam.stream();

  const camCanvas1 = createPoseCanvas($("#camCanvas1").get(0));
  const imgCanvas = createPoseCanvas($("#imgCanvas").get(0));

  const queryParams = new URLSearchParams(window.location.search);

  const levelId = queryParams.get("id");

  initGame(levelId, video, camCanvas1, imgCanvas, canvas, id1, id2);
});

