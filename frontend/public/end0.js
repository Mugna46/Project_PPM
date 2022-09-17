import { getUser } from "./scripts/fetchUtils.js";
import { startFakeTimer } from "./scripts/utils.js";

$(async () => {

    //startFakeTimer();
    var check_tie = sessionStorage.getItem("tie");
    //if(check_tie=="false"){
        const src = sessionStorage.getItem("screen"); 
        const canvas = document.getElementById("canvscreen");
        canvas.width = 1024;
        canvas.height = 1024;
        const ctx = canvas.getContext("2d");
        var image = new Image();
        image.src = src;
        image.addEventListener( "load", function(){
        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
        });
        var winner_id = sessionStorage.getItem("id");
        const user = await getUser(winner_id);
        document.getElementById("testo-player0").innerHTML = "Player "+user.name+" you won!";
        var operaNstring = sessionStorage.getItem("operaN");
        var operaN = JSON.parse(operaNstring);
        let listname = document.getElementById("testo_pose_fatte");
        for (let i = 0; i < operaN.length; i++) {
            var entryname = document.createElement("li");
            entryname.className = "list-group-item";
            entryname.appendChild(document.createTextNode(operaN[i]));
            listname.appendChild(entryname);
        }
    //}
  });