import { getUser } from "./scripts/fetchUtils.js";
import { startFakeTimer } from "./scripts/utils.js";

$(async () => {

    //startFakeTimer();
    var check_tie = sessionStorage.getItem("tie");
    if(check_tie=="false"){
        const win1 = sessionStorage.getItem("win1");
        const src = sessionStorage.getItem("screen"); 
        const canvas = document.getElementById("canvscreen");
        canvas.width = 1024;
        canvas.height = 1024;
        const ctx = canvas.getContext("2d");
        var image = new Image();
        image.src = src;
        if(win1=="true"){
        image.addEventListener( "load", function(){
            ctx.drawImage(image, canvas.width/2, 0, canvas.width/2, canvas.height, 0 , 0 ,canvas.width, canvas.height); //taglia giocatore sinistra
        });
        }else{
        image.addEventListener( "load", function(){
            ctx.drawImage(image, 0, 0, canvas.width/2, canvas.height, 0 , 0 , canvas.width, canvas.height); //taglia giocatore destra
            }); 
        }
        var winner_id = sessionStorage.getItem("id");
        const user = await getUser(winner_id);
        document.getElementById("testo-player0").innerHTML = "Player "+user.name+" you won!";
        document.getElementById("testo-player0").innerHTML = "Regards "+user.name+" you replicated well the following poses:";
        var operaNstring = sessionStorage.getItem("operaN");
        var operaN = JSON.parse(operaNstring);
        let listname = document.getElementById("testo_pose_fatte");
        for (let i = 0; i < operaN.length; i++) {
            var entryname = document.createElement("li");
            entryname.className = "list-group-item";
            entryname.appendChild(document.createTextNode(operaN[i]));
            listname.appendChild(entryname);
        }
    }else{
      
    }
  });