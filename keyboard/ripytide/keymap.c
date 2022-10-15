/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H
#include <stdio.h>

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_TAB,    KC_Q,    KC_D,    KC_R,    KC_W,    KC_B,                         KC_J,    KC_F,    KC_U,    KC_P, KC_SCLN, KC_COLN,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
LGUI_T(KC_ESC),   KC_A,    KC_S,    KC_H,    KC_T,    KC_G,                         KC_Y,    KC_N,    KC_E,    KC_O,    KC_I,  KC_ENT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT,    KC_Z,    KC_X,    KC_M,    KC_C,    KC_V,                         KC_K,    KC_L, KC_UNDS, KC_COMM,  KC_DOT, KC_RSFT,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                         KC_LCTL,  KC_BSPC,   MO(2),      MO(1),  KC_SPC, KC_RCTL
                                      //`--------------------------'  `--------------------------'
  ),
  [1] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      _______,   KC_P9,   KC_P7,   KC_P5,   KC_P3, KC_PMNS,                      XXXXXXX,   KC_LT,   KC_GT, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______,   KC_P8,   KC_P6,   KC_P4,   KC_P2, KC_PPLS,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, XXXXXXX, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_COMM, KC_PDOT, KC_PSLS, KC_PAST, KC_PEQL,                       KC_NUM, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______,   KC_P0,   KC_P1,    XXXXXXX, _______, _______
                                      //`--------------------------'  `--------------------------'
  ),
  [2] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      _______,   KC_F9,   KC_F7,   KC_F5,   KC_F3,   KC_F1,                      KC_HASH, KC_LCBR, KC_RCBR, KC_MINS, KC_PLUS, KC_CIRC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______,   KC_F8,   KC_F6,   KC_F4,   KC_F2, KC_PERC,                        KC_AT, KC_LPRN, KC_RPRN,  KC_EQL, KC_AMPR, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______,  KC_F12,  KC_F11,  KC_F10,  KC_DLR,  KC_GRV,                      KC_TILD, KC_LBRC, KC_RBRC, KC_EXLM, KC_QUES, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______, XXXXXXX,    KC_PIPE, _______,  _______
                                      //`--------------------------'  `--------------------------'
  ),
};

const key_override_t delete_shift = ko_make_basic(MOD_MASK_SHIFT, KC_BSPC, KC_DEL);
const key_override_t delete_ctrl = ko_make_basic(MOD_MASK_CTRL, KC_BSPC, KC_DEL);

const key_override_t underscrore_asterisk_shift = ko_make_basic(MOD_MASK_SHIFT, KC_UNDS, KC_ASTR);
const key_override_t comma_forwardslash_shift = ko_make_basic(MOD_MASK_SHIFT, KC_COMM, KC_SLSH);
const key_override_t fullstop_backslash_shift = ko_make_basic(MOD_MASK_SHIFT, KC_DOT, KC_BSLS);

const key_override_t semicolon_doublequote_shift = ko_make_basic(MOD_MASK_SHIFT, KC_SCLN, KC_DQUO);
const key_override_t colon_quote_shift = ko_make_basic(MOD_MASK_SHIFT, KC_COLN, KC_QUOT);


// This globally defines all key overrides to be used
const key_override_t **key_overrides = (const key_override_t *[]){
    &delete_shift,
	&delete_ctrl,
	&underscrore_asterisk_shift,
	&comma_forwardslash_shift,
	&fullstop_backslash_shift,
	&semicolon_doublequote_shift,
	&colon_quote_shift,
    NULL // Null terminate the array of overrides!
};


