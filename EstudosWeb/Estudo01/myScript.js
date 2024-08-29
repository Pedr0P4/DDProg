var isLight = true;

function ToggleLigthAndDark(){
    document.body.classList.toggle("my-dark-mode");
    isLight = !isLight;
    if(isLight) document.getElementById("ldmode").innerHTML = "Dark mode";
    else document.getElementById("ldmode").innerHTML = "Light mode";
}