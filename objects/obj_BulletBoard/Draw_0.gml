var border_l = 320 - (current_width / 2);
var border_r = 320 + (current_width / 2);
var border_u = 384 - current_height;
var border_d = 384;

// Clamps the Soul object inside the Bullet Board
/*  ORIGINAL
    obj_Soul.x = clamp(obj_Soul.x, border_l + 8, border_r - 8);
    obj_Soul.y = clamp(obj_Soul.y, border_u + 8, border_d - 8);
*/
// Dobby233Liu: change to account for any collision mask settings
obj_Soul.x = clamp(obj_Soul.x, border_l + obj_Soul.sprite_xoffset, border_r - obj_Soul.sprite_xoffset);
obj_Soul.y = clamp(obj_Soul.y, border_u + obj_Soul.sprite_yoffset, border_d - obj_Soul.sprite_yoffset);
    
// Draws the white outline first, and then the inner black space
draw_set_color(c_white);
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

// Draw the HP and LV, as well as initialise variables for the HP bar length
var hp_barwidth = global.PlayerMaxHP;
var hp_barwidth_fill = global.PlayerHP;
draw_set_font(font_battleui_hp);
draw_set_color(c_white);
draw_text(30, 400, global.Name + "    LV " + string(global.PlayerLV));
draw_text(320 + hp_barwidth, 400, string(global.PlayerHP) + " / " + string(global.PlayerMaxHP));

// Draw "HP"
draw_set_font(font_battleui_widgets);
draw_text(255, 400, "HP");

// Draw the health bar
draw_set_color(c_red);
draw_rectangle(300, 400, 300 + hp_barwidth, 418, false);
draw_set_color(c_yellow);
draw_rectangle(300, 400, 300 + hp_barwidth_fill, 418, false);