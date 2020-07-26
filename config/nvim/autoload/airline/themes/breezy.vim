let s:N1   = [ '#cfcfc2' , '#2d5c76' , 17 , 190 ]
let s:N2   = [ '#a5a6a8' , '#444a50' , 85 , 234 ]
let s:N3   = [ '#7a7c7d' , '#31363b' , 85 , 238 ]


let s:I1   = [ '#cfcfc2' , '#218058' , 17 , 190 ]
let s:I2   = [ '#a5a6a8' , '#444a50' , 85 , 234 ]
let s:I3   = [ '#7a7c7d' , '#31363b' , 85 , 238 ]


let s:V1   = [ '#cfcfc2' , '#808021' , 17 , 190 ]
let s:V2   = [ '#a5a6a8' , '#444a50' , 85 , 234 ]
let s:V3   = [ '#7a7c7d' , '#31363b' , 85 , 238 ]


let s:IA1 = [ '#7a7c7d' , '#31363b' , 239 , 234 , '' ]
let s:IA2 = [ '#7a7c7d' , '#31363b' , 239 , 235 , '' ]
let s:IA3 = [ '#7a7c7d' , '#31363b' , 239 , 236 , '' ]

let g:airline#themes#breezy#palette = {}

let g:airline#themes#breezy#palette.accents = {
        \ 'red': [ '#f44f4f' , '' , 160 , '' ]
        \ }

let g:airline#themes#breezy#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#breezy#palette.normal_modified = {
       \ 'airline_c': [ '#b4b5b6' , '#31363b' , 255     , 53      , ''     ] ,
       \ }

let g:airline#themes#breezy#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#breezy#palette.insert_modified = {
       \ 'airline_c': [ '#b4b5b6' , '#31363b' , 255     , 53      , ''     ] ,
       \ }

" let g:airline#themes#breezy#palette.insert_paste = {
"       \ 'airline_a': [ ''   , '#d78700' , s:I1[2] , 172     , ''     ] ,
"       \ }

let g:airline#themes#breezy#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#breezy#palette.visual_modified = {
       \ 'airline_c': [ '#b4b5b6' , '#31363b' , 255     , 53      , ''     ] ,
       \ }


let g:airline#themes#breezy#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
" if !get(g:, 'loaded_ctrlp', 0)
"   finish
" endif
" let g:airline#themes#breezy#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
"       \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
"       \ [ '#aaabac' , '#875fd7' , 231 , 98  , ''     ],
"       \ [ '#5f00af' , '#aaabac' , 55  , 231 , 'bold' ])
