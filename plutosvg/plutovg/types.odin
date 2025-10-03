package odin_plutovg

import "core:c"

PLUTOVG_PI      :: 3.14159265358979323846
PLUTOVG_TWO_PI  :: 6.28318530717958647693
PLUTOVG_HALF_PI :: 1.57079632679489661923
PLUTOVG_SQRT2   :: 1.41421356237309504880
PLUTOVG_KAPPA   :: 0.55228474983079339840

plutovg_destroy_func_t :: proc "c" (rawptr)
plutovg_write_func_t :: proc "c" (rawptr, rawptr, c.int)

plutovg_point_t :: struct {
	x: f32, 
	y: f32, 
}

PLUTOVG_EMPTY_POINT :: (plutovg_point_t){0, 0}

plutovg_rect_t :: struct {
	x: f32, 
	y: f32, 
	w: f32, 
	h: f32, 
}

PLUTOVG_EMPTY_RECT :: (plutovg_rect_t){0, 0, 0, 0}

plutovg_matrix_t :: struct {
	a:  f32, 
	b:  f32, 
	_c: f32, 
	d:  f32, 
	e:  f32, 
	f:  f32, 
}

PLUTOVG_IDENTITY_MATRIX :: (plutovg_matrix_t){1, 0, 0, 1, 0, 0}

plutovg_path_command_t :: enum c.int {
	MOVE_TO,  
	LINE_TO,  
	CUBIC_TO, 
	CLOSE,    
}

plutovg_path_element_t :: struct #raw_union {
	header: struct {
		command: plutovg_path_command_t, 
		length:  c.int,                  
	}, 
	point: plutovg_point_t,                                                                                                                                         ///< A coordinate point in the path.
}

plutovg_path_iterator_t :: struct {
	elements: ^plutovg_path_element_t, 
	size:     c.int,                   
	index:    c.int,                   
}

plutovg_path_traverse_func_t :: proc "c" (rawptr, plutovg_path_command_t, ^plutovg_point_t, c.int)

plutovg_text_encoding_t :: enum c.int {
	LATIN1, 
	UTF8,   
	UTF16,  
	UTF32,  
}

plutovg_text_iterator_t :: struct {
	text:     rawptr,                  
	length:   c.int,                   
	encoding: plutovg_text_encoding_t, 
	index:    c.int,                   
}

plutovg_codepoint_t :: c.uint

plutovg_color_t :: struct {
	r: f32, 
	g: f32, 
	b: f32, 
	a: f32, 
}

PLUTOVG_BLACK_COLOR   :: (plutovg_color_t){0, 0, 0, 1}
PLUTOVG_WHITE_COLOR   :: (plutovg_color_t){1, 1, 1, 1}
PLUTOVG_RED_COLOR     :: (plutovg_color_t){1, 0, 0, 1}
PLUTOVG_GREEN_COLOR   :: (plutovg_color_t){0, 1, 0, 1}
PLUTOVG_BLUE_COLOR    :: (plutovg_color_t){0, 0, 1, 1}
PLUTOVG_YELLOW_COLOR  :: (plutovg_color_t){1, 1, 0, 1}
PLUTOVG_CYAN_COLOR    :: (plutovg_color_t){0, 1, 1, 1}
PLUTOVG_MAGENTA_COLOR :: (plutovg_color_t){1, 0, 1, 1}

plutovg_texture_type_t :: enum c.int {
	PLAIN, 
	TILED, 
}

plutovg_spread_method_t :: enum c.int {
	PAD,     
	REFLECT, 
	REPEAT,  
}

plutovg_gradient_stop_t :: struct {
	offset: f32,             
	color:  plutovg_color_t, 
}

plutovg_fill_rule_t :: enum c.int {
	NON_ZERO, 
	EVEN_ODD, 
}

plutovg_operator_t :: enum c.int {
	CLEAR,    
	SRC,      
	DST,      
	SRC_OVER, 
	DST_OVER, 
	SRC_IN,   
	DST_IN,   
	SRC_OUT,  
	DST_OUT,  
	SRC_ATOP, 
	DST_ATOP, 
	XOR,      
}

plutovg_line_cap_t :: enum c.int {
	BUTT,   
	ROUND,  
	SQUARE, 
}

plutovg_line_join_t :: enum c.int {
	MITER, 
	ROUND, 
	BEVEL, 
}

plutovg_surface_t :: struct {
	ref_count: c.int,
	width:     c.int,
	height:    c.int,
	stride:    c.int,
	data:      ^c.uchar,
}

plutovg_path_t :: struct {
	ref_count:    c.int,
	num_points:   c.int,
	num_contours: c.int,
	num_curves:   c.int,
	start_point:  plutovg_point_t,
	elements:     struct {
		data:     ^plutovg_path_element_t,
		size:     c.int,
		capacity: c.int,
	},
}

plutovg_paint_t :: struct {
	ref_count: c.int,
	type:      plutovg_paint_type_t,
}

plutovg_solid_paint_t :: struct {
	base:  plutovg_paint_t,
	color: plutovg_color_t,
}

plutovg_gradient_type_t :: enum c.int {
	LINEAR,
	RADIAL,
}

plutovg_gradient_paint_t :: struct {
	base:    plutovg_paint_t,
	type:    plutovg_gradient_type_t,
	spread:  plutovg_spread_method_t,
	_matrix: plutovg_matrix_t,
	stops:   ^plutovg_gradient_stop_t,
	nstops:  c.int,
	values:  [6]f32,
}

plutovg_texture_paint_t :: struct {
	base:    plutovg_paint_t,
	type:    plutovg_texture_type_t,
	opacity: f32,
	_matrix: plutovg_matrix_t,
	surface: ^plutovg_surface_t,
}

plutovg_span_t :: struct {
	x:        c.int,
	len:      c.int,
	y:        c.int,
	coverage: c.uchar,
}

plutovg_span_buffer_t :: struct {
	spans: struct {
		data:     ^plutovg_span_t,
		size:     c.int,
		capacity: c.int,
	},
	x: c.int,
	y: c.int,
	w: c.int,
	h: c.int,
}

plutovg_stroke_dash_t :: struct {
	offset: f32,
	array:  struct {
		data:     ^f32,
		size:     c.int,
		capacity: c.int,
	},
}

plutovg_stroke_style_t :: struct {
	width:       f32,
	cap:         plutovg_line_cap_t,
	join:        plutovg_line_join_t,
	miter_limit: f32,
}

plutovg_stroke_data_t :: struct {
	style: plutovg_stroke_style_t,
	dash:  plutovg_stroke_dash_t,
}

plutovg_state_t :: struct {
	paint:      ^plutovg_paint_t,
	font_face:  ^plutovg_font_face_t,
	color:      plutovg_color_t,
	_matrix:    plutovg_matrix_t,
	stroke:     plutovg_stroke_data_t,
	clip_spans: plutovg_span_buffer_t,
	winding:    plutovg_fill_rule_t,
	op:         plutovg_operator_t,
	font_size:  f32,
	opacity:    f32,
	clipping:   bool,
	next:       ^plutovg_state_t,
}

plutovg_canvas_t :: struct {
	ref_count:   c.int,
	surface:     ^plutovg_surface_t,
	path:        ^plutovg_path_t,
	state:       ^plutovg_state_t,
	freed_state: ^plutovg_state_t,
	clip_rect:   plutovg_rect_t,
	clip_spans:  plutovg_span_buffer_t,
	fill_spans:  plutovg_span_buffer_t,
}

plutovg_paint_type_t :: enum c.int {
	COLOR,
	GRADIENT,
	TEXTURE,
}

_buf :: struct {
	data:   [^]byte,
	cursor: c.int,
	size:   c.int,
}

vertex_type :: distinct c.short // can't use stbtt_int16 because that's not visible in the header file
stbtt_vertex :: struct {
	x, y, cx, cy, cx1, cy1: vertex_type,
	type, padding:          byte,
}

stbtt_fontinfo :: struct {
	userdata:  rawptr,
	data:      [^]byte,
	fontstart: c.int,

	numGlyphs: c.int,

	loca, head, glyf, hhea, hmtx, kern, gpos, svg: c.int,
	index_map: c.int,
	indexToLocFormat: c.int,

	cff:         _buf,
	charstrings: _buf,
	gsubrs:      _buf,
	subrs:       _buf,
	fontdicts:   _buf,
	fdselect:    _buf,
}

glyph_t :: struct {
  vertices: ^stbtt_vertex,
  nvertices: c.int,
  index: c.int,
  advance_width: c.int,
  left_side_bearing: c.int,
  x1: c.int,
  y1: c.int,
  x2: c.int,
  y2: c.int
}

GLYPH_CACHE_SIZE :: 256

plutovg_font_face_t :: struct {
    ref_count: c.int,
    ascent: c.int,
    descent: c.int,
    line_gap: c.int,
    x1: c.int,
    y1: c.int,
    x2: c.int,
    y2: c.int,
    info: stbtt_fontinfo,
    glyphs: ^^[GLYPH_CACHE_SIZE]glyph_t,
    destroy_func: plutovg_destroy_func_t,
    closure: rawptr
}
