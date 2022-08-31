import { getUserMe } from "./scripts/fetchUtils.js";
import { createPoseCanvas, initGame } from "./scripts/utils.js";

$(async () => {
  const userlist1 = await getUserMe(2);
  const userlist2 = await getUserMe(3);
  document.getElementById("p1").innerHTML = userlist1.name;
  const video = document.getElementById("video");
  const webcam = new Webcam(video, "user");
  webcam.stream();
  const camCanvas1 = createPoseCanvas($("#camCanvas1").get(0));
  const camCanvas2 = createPoseCanvas($("#camCanvas2").get(0));
  const imgCanvas = createPoseCanvas($("#imgCanvas").get(0));

  const queryParams = new URLSearchParams(window.location.search);

  const levelId = queryParams.get("id");

  initGame(levelId, video, camCanvas1, camCanvas2, imgCanvas);
});
