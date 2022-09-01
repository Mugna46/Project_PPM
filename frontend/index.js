import { Config } from "./scripts/config.js";
import { getUserMe } from "./scripts/fetchUtils.js";

 $(() => {
  const form = $("#login-form");
  form.submit(async (e) => {
    e.preventDefault();
    const data = form.serializeArray().reduce(
      (res, val) => ({
        ...res,
        [val.name]: val.value,
      }),
      {}
    );

    const response = await fetch(`${Config.BASE_URL}login`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json" ,
      },
      body: JSON.stringify(data),
    });
    const jsonResponse = await response.json();
    if (response.ok) { 
      localStorage.setItem("ACCESS_TOKEN", jsonResponse.access_token);
      const user = getUserMe();
      const v = await user;
      var id= v.id;
      sessionStorage.setItem("id1", id);
      location.href = "start.html";
    }
    return false;
  });
});

