import { Config } from "./scripts/config.js";
import { getUser, getVideo } from "./scripts/fetchUtils.js";

$(async () => {
  const queryParams = new URLSearchParams(window.location.search);

  var check_tie = sessionStorage.getItem("tie");

  if(check_tie=="false"){
    var winner_id = sessionStorage.getItem("id");
    const user = await getUser(winner_id);
    var score = sessionStorage.getItem("score");
    document.getElementById("testo_end").innerHTML = "Congratulazioni "+user.name+ " hai vinto con uno score di: "+score;
  }else{
    document.getElementById("testo_end").innerHTML = "La partita è finita in parità";
  }
});
