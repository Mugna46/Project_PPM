import { getUser } from "./scripts/fetchUtils.js";
import { startFakeTimer } from "./scripts/utils.js";

$(async () => {

    //startFakeTimer();
    var check_tie = sessionStorage.getItem("tie");
    const src = sessionStorage.getItem("screen");
    const canvas = document.getElementById("canvscreen");
    canvas.width = 1024;
    canvas.height = 1024;
    const ctx = canvas.getContext("2d");
    var image = new Image();
    image.src = src;
    if (check_tie == "false") {
        const win1 = sessionStorage.getItem("win1");
        if (win1 == "true") {
            image.addEventListener("load", function () {
                ctx.drawImage(image, canvas.width / 2, 0, canvas.width / 2, canvas.height, 0, 0, canvas.width, canvas.height); //taglia giocatore sinistra
            });
        } else {
            image.addEventListener("load", function () {
                ctx.drawImage(image, 0, 0, canvas.width / 2, canvas.height, 0, 0, canvas.width, canvas.height); //taglia giocatore destra
            });
        }
        var winner_id = sessionStorage.getItem("id");
        const user = await getUser(winner_id);
        document.getElementById("testo-player0").innerHTML = "Player " + user.name + " you won!";
        document.getElementById("testo_pose_fatte1").innerHTML = "Regards " + user.name + " you replicated well the following poses:";
        var operaNstring = sessionStorage.getItem("operaN");
        var operaN = JSON.parse(operaNstring);
        let listname = document.getElementById("testo_pose_fatte1");
        for (let i = 0; i < operaN.length; i++) {
            var entryname = document.createElement("li");
            entryname.className = "list-group-item";
            entryname.appendChild(document.createTextNode(operaN[i]));
            listname.appendChild(entryname);
        }
    } else {
        var id1 = sessionStorage.getItem("id1");
        var id2 = sessionStorage.getItem("id2");
        const user1 = await getUser(id1);
        const user2 = await getUser(id2);
        document.getElementById("testo-player0").innerHTML = "The game ended with a tie!";
        document.getElementById("testo_pose_fatte1").innerHTML = "Regards " + user1.name + " you replicated well the following poses:";
        document.getElementById("testo_pose_fatte2").innerHTML = "Regards " + user2.name + " you replicated well the following poses:";
        var operaNstring1 = sessionStorage.getItem("operaN1");
        var operaN1 = JSON.parse(operaNstring1);
        var operaNstring2 = sessionStorage.getItem("operaN2");
        var operaN2 = JSON.parse(operaNstring2);
        let listname1 = document.getElementById("testo_pose_fatte1");
        let listname2 = document.getElementById("testo_pose_fatte2");
        for (let i = 0; i < operaN.length; i++) {
            var entryname1 = document.createElement("li");
            var entryname2 = document.createElement("li");
            entryname1.className = "list-group-item";
            entryname2.className = "list-group-item";
            entryname1.appendChild(document.createTextNode(operaN2[i]));
            entryname2.appendChild(document.createTextNode(operaN1[i]));
            listname1.appendChild(entryname1);
            listname2.appendChild(entryname2);  
        }
        image.addEventListener("load", function () {
            ctx.drawImage(image, 0, 0, canvas.width , canvas.height);
        });
    }
});