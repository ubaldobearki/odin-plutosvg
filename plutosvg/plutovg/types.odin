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
	x: f32, ///< The x-coordinate of the point.
	y: f32, ///< The y-coordinate of the point.
}

PLUTOVG_EMPTY_POINT :: (plutovg_point_t){0, 0}

plutovg_rect_t :: struct {
	x: f32, ///< The x-coordinate of the top-left corner of the rectangle.
	y: f32, ///< The y-coordinate of the top-left corner of the rectangle.
	w: f32, ///< The width of the rectangle.
	h: f32, ///< The height of the rectangle.
}

PLUTOVG_EMPTY_RECT :: (plutovg_rect_t){0, 0, 0, 0}

/**
* @brief A structure representing a 2D transformation matrix.
*/
plutovg_matrix_t :: struct {
	a:  f32, ///< The horizontal scaling factor.
	b:  f32, ///< The vertical shearing factor.
	_c: f32, ///< The horizontal shearing factor.
	d:  f32, ///< The vertical scaling factor.
	e:  f32, ///< The horizontal translation offset.
	f:  f32, ///< The vertical translation offset.
}

PLUTOVG_IDENTITY_MATRIX :: (plutovg_matrix_t){1, 0, 0, 1, 0, 0}

/**
* @brief Enumeration defining path commands.
*/
plutovg_path_command_t :: enum c.int {
	MOVE_TO,  ///< Moves the current point to a new position.
	LINE_TO,  ///< Draws a straight line to a new point.
	CUBIC_TO, ///< Draws a cubic Bézier curve to a new point.
	CLOSE,    ///< Closes the current path by drawing a line to the starting point.
}

/**
* @brief Union representing a path element.
*
* A path element can be a command with a length or a coordinate point.
* Each command type in the path element array is followed by a specific number of points:
* - `PLUTOVG_PATH_COMMAND_MOVE_TO`: 1 point
* - `PLUTOVG_PATH_COMMAND_LINE_TO`: 1 point
* - `PLUTOVG_PATH_COMMAND_CUBIC_TO`: 3 points
* - `PLUTOVG_PATH_COMMAND_CLOSE`: 1 point
*
* @example
* const plutovg_path_element_t* elements;
* int count = plutovg_path_get_elements(path, &elements);
* for(int i = 0; i < count; i += elements[i].header.length) {
*     plutovg_path_command_t command = elements[i].header.command;
*     switch(command) {
*     case PLUTOVG_PATH_COMMAND_MOVE_TO:
*         printf("MoveTo: %g %g\n", elements[i + 1].point.x, elements[i + 1].point.y);
*         break;
*     case PLUTOVG_PATH_COMMAND_LINE_TO:
*         printf("LineTo: %g %g\n", elements[i + 1].point.x, elements[i + 1].point.y);
*         break;
*     case PLUTOVG_PATH_COMMAND_CUBIC_TO:
*         printf("CubicTo: %g %g %g %g %g %g\n",
*                elements[i + 1].point.x, elements[i + 1].point.y,
*                elements[i + 2].point.x, elements[i + 2].point.y,
*                elements[i + 3].point.x, elements[i + 3].point.y);
*         break;
*     case PLUTOVG_PATH_COMMAND_CLOSE:
*         printf("Close: %g %g\n", elements[i + 1].point.x, elements[i + 1].point.y);
*         break;
*     }
* }
*/
plutovg_path_element_t :: struct #raw_union {
	header: struct {
		command: plutovg_path_command_t, ///< The path command.
		length:  c.int,                  ///< Number of elements including the header.
	}, ///< Header for path commands.
	point: plutovg_point_t,                                                                                                                                         ///< A coordinate point in the path.
}

/**
* @brief Iterator for traversing path elements in a path.
*/
plutovg_path_iterator_t :: struct {
	elements: ^plutovg_path_element_t, ///< Pointer to the array of path elements.
	size:     c.int,                   ///< Total number of elements in the array.
	index:    c.int,                   ///< Current position in the array.
}

/**
* @brief Callback function type for traversing a path.
*
* This function type defines a callback used to traverse path elements.
*
* @param closure A pointer to user-defined data passed to the callback.
* @param command The current path command.
* @param points An array of points associated with the command.
* @param npoints The number of points in the array.
*/
plutovg_path_traverse_func_t :: proc "c" (rawptr, plutovg_path_command_t, ^plutovg_point_t, c.int)

/**
* @brief Text encodings used for converting text data to code points.
*/
plutovg_text_encoding_t :: enum c.int {
	LATIN1, ///< Latin-1 encoding
	UTF8,   ///< UTF-8 encoding
	UTF16,  ///< UTF-16 encoding
	UTF32,  ///< UTF-32 encoding
}

/**
* @brief Iterator for traversing code points in text data.
*/
plutovg_text_iterator_t :: struct {
	text:     rawptr,                  ///< Pointer to the text data.
	length:   c.int,                   ///< Length of the text data.
	encoding: plutovg_text_encoding_t, ///< Encoding format of the text data.
	index:    c.int,                   ///< Current position in the text data.
}

/**
* @brief Represents a Unicode code point.
*/
plutovg_codepoint_t :: c.uint

/**
* @brief Represents a color with red, green, blue, and alpha components.
*/
plutovg_color_t :: struct {
	r: f32, ///< Red component (0 to 1).
	g: f32, ///< Green component (0 to 1).
	b: f32, ///< Blue component (0 to 1).
	a: f32, ///< Alpha (opacity) component (0 to 1).
}

PLUTOVG_BLACK_COLOR   :: (plutovg_color_t){0, 0, 0, 1}
PLUTOVG_WHITE_COLOR   :: (plutovg_color_t){1, 1, 1, 1}
PLUTOVG_RED_COLOR     :: (plutovg_color_t){1, 0, 0, 1}
PLUTOVG_GREEN_COLOR   :: (plutovg_color_t){0, 1, 0, 1}
PLUTOVG_BLUE_COLOR    :: (plutovg_color_t){0, 0, 1, 1}
PLUTOVG_YELLOW_COLOR  :: (plutovg_color_t){1, 1, 0, 1}
PLUTOVG_CYAN_COLOR    :: (plutovg_color_t){0, 1, 1, 1}
PLUTOVG_MAGENTA_COLOR :: (plutovg_color_t){1, 0, 1, 1}

/**
* @brief Defines the type of texture, either plain or tiled.
*/
plutovg_texture_type_t :: enum c.int {
	PLAIN, ///< Plain texture.
	TILED, ///< Tiled texture.
}

/**
* @brief Defines the spread method for gradients.
*/
plutovg_spread_method_t :: enum c.int {
	PAD,     ///< Pad the gradient's edges.
	REFLECT, ///< Reflect the gradient beyond its bounds.
	REPEAT,  ///< Repeat the gradient pattern.
}

/**
* @brief Represents a gradient stop.
*/
plutovg_gradient_stop_t :: struct {
	offset: f32,             ///< The offset of the gradient stop, as a value between 0 and 1.
	color:  plutovg_color_t, ///< The color of the gradient stop.
}

/**
* @brief Defines fill rule types for filling paths.
*/
plutovg_fill_rule_t :: enum c.int {
	NON_ZERO, ///< Non-zero winding fill rule.
	EVEN_ODD, ///< Even-odd fill rule.
}

/**
* @brief Defines compositing operations.
*/
plutovg_operator_t :: enum c.int {
	CLEAR,    ///< Clears the destination (resulting in a fully transparent image).
	SRC,      ///< Source replaces destination.
	DST,      ///< Destination is kept, source is ignored.
	SRC_OVER, ///< Source is composited over destination.
	DST_OVER, ///< Destination is composited over source.
	SRC_IN,   ///< Source within destination (only the overlapping part of source is shown).
	DST_IN,   ///< Destination within source.
	SRC_OUT,  ///< Source outside destination (non-overlapping part of source is shown).
	DST_OUT,  ///< Destination outside source.
	SRC_ATOP, ///< Source atop destination (source shown over destination but only in the destination's bounds).
	DST_ATOP, ///< Destination atop source (destination shown over source but only in the source's bounds).
	XOR,      ///< Source and destination are combined, but their overlapping regions are cleared.
}

/**
* @brief Defines the shape used at the ends of open subpaths.
*/
plutovg_line_cap_t :: enum c.int {
	BUTT,   ///< Flat edge at the end of the stroke.
	ROUND,  ///< Rounded ends at the end of the stroke.
	SQUARE, ///< Square ends at the end of the stroke.
}

/**
* @brief Defines the shape used at the corners of paths.
*/
plutovg_line_join_t :: enum c.int {
	MITER, ///< Miter join with sharp corners.
	ROUND, ///< Rounded join.
	BEVEL, ///< Beveled join with a flattened corner.
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
