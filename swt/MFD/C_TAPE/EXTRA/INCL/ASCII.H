/* ascii.h --- ASCII control character definitions */

/* Note: on the primes it is okay to define these as integer */
/* constants, since int's and char's are the same size */

#ifndef _ASCII_
#define _ASCII_ 1

#define NUL     0200
#define CTRL_A  0201
#define SOH     0201
#define CTRL_B  0202
#define STX     0202
#define CTRL_C  0203
#define ETX     0203
#define CTRL_D  0204
#define EOT     0204
#define CTRL_E  0205
#define ENQ     0205
#define CTRL_F  0206
#define ACK     0206
#define CTRL_G  0207
#define BEL     0207
#define CTRL_H  0210
#define BS      0210
#define CTRL_I  0211
#define HT      0211
#define CTRL_J  0212
#define LF      0212
#define CTRL_K  0213
#define VT      0213
#define CTRL_L  0214
#define FF      0214
#define CTRL_M  0215
#define CR      0215
#define CTRL_N  0216
#define SO      0216
#define CTRL_O  0217
#define SI      0217
#define CTRL_P  0220
#define DLE     0220
#define CTRL_Q  0221
#define DC1     0221
#define CTRL_R  0222
#define DC2     0222
#define CTRL_S  0223
#define DC3     0223
#define CTRL_T  0224
#define DC4     0224
#define CTRL_U  0225
#define NAK     0225
#define CTRL_V  0226
#define SYN     0226
#define CTRL_W  0227
#define ETB     0227
#define CTRL_X  0230
#define CAN     0230
#define CTRL_Y  0231
#define EM      0231
#define CTRL_Z  0232
#define SUB     0232
#define CTRL_LBRACK     0233
#define ESC     0233
#define CTRL_BACKSLASH  0234
#define FS      0234
#define CTRL_RBRACK     0235
#define GS      0235
#define CTRL_CARET      0236
#define RS      0236
#define CTRL_UNDERLINE  0237
#define US      0237
#define SP      0240
#define DEL     0377


/* Synonyms for important non-printing characters: */

#define BACKSPACE       BS
#define TAB             HT
#define BELL            BEL
#define NEWLINE         LF
#define RHT             DC1
#define RUBOUT          DEL
#endif
