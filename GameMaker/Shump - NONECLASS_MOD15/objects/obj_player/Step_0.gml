//Chamado do método de controlar o player
controla_player();

//Se apertar Tab, ativa o debug
if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug;

//Mudança na escala x quando necessário
if(xscale > 1.1 or xscale < 0.9) xscale = lerp(xscale, 1, 0.2);
else xscale = 1;
//Mudança na escala y quando necessário
if(yscale > 1.1 or yscale < 0.9) yscale = lerp(yscale, 1, 0.2);
else yscale = 1;

////Debug do level do tiro
//if(keyboard_check_pressed(ord("I"))) level_tiro++;
//if(keyboard_check_pressed(ord("K"))) level_tiro--;
////Limitando os leveis no level mínimo e máximo
//level_tiro = clamp(level_tiro, 1, 3);

//Debug de vida
//if(keyboard_check_pressed(vk_enter)) perde_vida();