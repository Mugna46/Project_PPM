import { createPoseCanvas, initGame } from "./scripts/utils.js";


  const video = document.getElementById("video");
  const webcam = new Webcam(video, "user");
  webcam.stream();
  const camCanvas1 = createPoseCanvas($("#camCanvas1").get(0));
  const camCanvas2 = createPoseCanvas($("#camCanvas2").get(0));
  const imgCanvas = createPoseCanvas($("#imgCanvas").get(0));

  const queryParams = new URLSearchParams(window.location.search);

  const levelId = queryParams.get("id");

  initGame(levelId, video, camCanvas1, camCanvas2, imgCanvas);

