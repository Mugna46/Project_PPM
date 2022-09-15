import { Config } from "./scripts/config.js";
import { getUser} from "./scripts/fetchUtils.js";
import {createLeaderboard} from "./scripts/utils.js";

$(async () => {

  const queryParams = new URLSearchParams(window.location.search);

  var check_tie = sessionStorage.getItem("tie");

  if(check_tie=="false"){
    var winner_id = sessionStorage.getItem("id");
    const user = await getUser(winner_id);
    var score = sessionStorage.getItem("score");
    var operaN = sessionStorage.getItem("operaN");
    document.getElementById("testo_end").innerHTML = "Congratulations "+user.name+ " you won with a score of: "+score+ "ed hai indovinato" + operaN;
  }else{
    document.getElementById("testo_end").innerHTML = "The game ended with a tie!";
  }

  createLeaderboard();

  $(document).ready(function(){
    $("#menuButton").click(function(){
      $("#menu").slideToggle();
    }); 
  });

  
});




