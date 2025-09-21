package odin_plutovg

import "core:c"

when ODIN_OS == .Linux {
	foreign import plutovg "../../lib/linuxbsd/libplutovg.a"
} else {
	#panic(true)
}

@(default_calling_convention = "c")
foreign plutovg {

	@(link_name = "plutovg_canvas_add_glyph")
	canvas_add_glyph :: proc(canvas: ^plutovg_canvas_t, codepoint: plutovg_codepoint_t, x: f32, y: f32) -> f32 ---

	@(link_name = "plutovg_canvas_add_path")
	canvas_add_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	@(link_name = "plutovg_canvas_add_text")
	canvas_add_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	@(link_name = "plutovg_canvas_arc")
	canvas_arc :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, r: f32, a0: f32, a1: f32, ccw: bool) ---

	@(link_name = "plutovg_canvas_arc_to")
	canvas_arc_to :: proc(canvas: ^plutovg_canvas_t, rx: f32, ry: f32, angle: f32, large_arc_flag: bool, sweep_flag: bool, x: f32, y: f32) ---

	@(link_name = "plutovg_canvas_circle")
	canvas_circle :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, r: f32) ---

	@(link_name = "plutovg_canvas_clip")
	canvas_clip :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_clip_extents")
	canvas_clip_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_canvas_clip_path")
	canvas_clip_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	@(link_name = "plutovg_canvas_clip_preserve")
	canvas_clip_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_clip_rect")
	canvas_clip_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	@(link_name = "plutovg_canvas_clip_text")
	canvas_clip_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	@(link_name = "plutovg_canvas_close_path")
	canvas_close_path :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_create")
	canvas_create :: proc(surface: ^plutovg_surface_t) -> ^plutovg_canvas_t ---

	@(link_name = "plutovg_canvas_cubic_to")
	canvas_cubic_to :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32, x3: f32, y3: f32) ---

	@(link_name = "plutovg_canvas_destroy")
	canvas_destroy :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_ellipse")
	canvas_ellipse :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, rx: f32, ry: f32) ---

	@(link_name = "plutovg_canvas_fill")
	canvas_fill :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_fill_extents")
	canvas_fill_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_canvas_fill_path")
	canvas_fill_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	@(link_name = "plutovg_canvas_fill_preserve")
	canvas_fill_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_fill_rect")
	canvas_fill_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	@(link_name = "plutovg_canvas_fill_text")
	canvas_fill_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	@(link_name = "plutovg_canvas_font_metrics")
	canvas_font_metrics :: proc(canvas: ^plutovg_canvas_t, ascent: ^f32, descent: ^f32, line_gap: ^f32, extents: ^plutovg_rect_t) ---

	@(link_name = "canvas_get_current_point")
	canvas_get_current_point :: proc(canvas: ^plutovg_canvas_t, x: ^f32, y: ^f32) ---

	@(link_name = "canvas_get_dash_array")
	canvas_get_dash_array :: proc(canvas: ^plutovg_canvas_t, dashes: ^^f32) -> c.int ---

	@(link_name = "canvas_get_dash_offset")
	canvas_get_dash_offset :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	@(link_name = "canvas_get_fill_rule")
	canvas_get_fill_rule :: proc(canvas: ^plutovg_canvas_t) -> plutovg_fill_rule_t ---

	@(link_name = "canvas_get_font_face")
	canvas_get_font_face :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_font_face_t ---

	@(link_name = "canvas_get_font_size")
	canvas_get_font_size :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	@(link_name = "canvas_get_line_cap")
	canvas_get_line_cap :: proc(canvas: ^plutovg_canvas_t) -> plutovg_line_cap_t ---

	@(link_name = "canvas_get_line_join")
	canvas_get_line_join :: proc(canvas: ^plutovg_canvas_t) -> plutovg_line_join_t ---

	@(link_name = "canvas_get_line_width")
	canvas_get_line_width :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	@(link_name = "plutovg_canvas_get_matrix")
	canvas_get_matrix :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_get_miter_limit")
	canvas_get_miter_limit :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	@(link_name = "plutovg_canvas_get_opacity")
	canvas_get_opacity :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	@(link_name = "plutovg_canvas_get_operator")
	canvas_get_operator :: proc(canvas: ^plutovg_canvas_t) -> plutovg_operator_t ---

	@(link_name = "plutovg_canvas_get_paint")
	canvas_get_paint :: proc(canvas: ^plutovg_canvas_t, color: ^plutovg_color_t) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_canvas_get_path")
	canvas_get_path :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_path_t ---

	@(link_name = "plutovg_canvas_get_reference_count")
	canvas_get_reference_count :: proc(canvas: ^plutovg_canvas_t) -> c.int ---

	@(link_name = "plutovg_canvas_get_surface")
	canvas_get_surface :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_canvas_glyph_metrics")
	canvas_glyph_metrics :: proc(canvas: ^plutovg_canvas_t, codepoint: plutovg_codepoint_t, advance_width: ^f32, left_side_bearing: ^f32, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_canvas_map")
	canvas_map :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, xx: ^f32, yy: ^f32) ---

	@(link_name = "plutovg_canvas_map_point")
	canvas_map_point :: proc(canvas: ^plutovg_canvas_t, src: ^plutovg_point_t, dst: ^plutovg_point_t) ---

	@(link_name = "plutovg_canvas_map_rect")
	canvas_map_rect :: proc(canvas: ^plutovg_canvas_t, src: ^plutovg_rect_t, dst: ^plutovg_rect_t) ---

	@(link_name = "plutovg_canvas_move_to")
	canvas_move_to :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32) ---

	@(link_name = "plutovg_canvas_line_to")
	canvas_line_to :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32) ---

	@(link_name = "plutovg_canvas_new_path")
	canvas_new_path :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_paint")
	canvas_paint :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_quad_to")
	canvas_quad_to :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32) ---

	@(link_name = "plutovg_canvas_rect")
	canvas_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	@(link_name = "plutovg_canvas_reference")
	canvas_reference :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_canvas_t ---

	@(link_name = "plutovg_canvas_reset_matrix")
	canvas_reset_matrix :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_restore")
	canvas_restore :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_rotate")
	canvas_rotate :: proc(canvas: ^plutovg_canvas_t, angle: f32) ---

	@(link_name = "plutovg_canvas_round_rect")
	canvas_round_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32, rx: f32, ry: f32) ---

	@(link_name = "plutovg_canvas_save")
	canvas_save :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_scale")
	canvas_scale :: proc(canvas: ^plutovg_canvas_t, sx: f32, sy: f32) ---

	@(link_name = "plutovg_canvas_set_color")
	canvas_set_color :: proc(canvas: ^plutovg_canvas_t, color: ^plutovg_color_t) ---

	@(link_name = "plutovg_canvas_set_dash")
	canvas_set_dash :: proc(canvas: ^plutovg_canvas_t, offset: f32, dashes: ^f32, ndashes: c.int) ---

	@(link_name = "plutovg_canvas_set_dash_array")
	canvas_set_dash_array :: proc(canvas: ^plutovg_canvas_t, dashes: ^f32, ndashes: c.int) ---

	@(link_name = "plutovg_canvas_set_dash_offset")
	canvas_set_dash_offset :: proc(canvas: ^plutovg_canvas_t, offset: f32) ---

	@(link_name = "plutovg_canvas_set_fill_rule")
	canvas_set_fill_rule :: proc(canvas: ^plutovg_canvas_t, winding: plutovg_fill_rule_t) ---

	@(link_name = "plutovg_canvas_set_font")
	canvas_set_font :: proc(canvas: ^plutovg_canvas_t, face: ^plutovg_font_face_t, size: f32) ---

	@(link_name = "plutovg_canvas_set_font_face")
	canvas_set_font_face :: proc(canvas: ^plutovg_canvas_t, face: ^plutovg_font_face_t) ---

	@(link_name = "plutovg_canvas_set_font_size")
	canvas_set_font_size :: proc(canvas: ^plutovg_canvas_t, size: f32) ---

	@(link_name = "plutovg_canvas_set_linear_gradient")
	canvas_set_linear_gradient :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_set_line_cap")
	canvas_set_line_cap :: proc(canvas: ^plutovg_canvas_t, line_cap: plutovg_line_cap_t) ---

	@(link_name = "plutovg_canvas_set_line_join")
	canvas_set_line_join :: proc(canvas: ^plutovg_canvas_t, line_join: plutovg_line_join_t) ---

	@(link_name = "plutovg_canvas_set_line_width")
	canvas_set_line_width :: proc(canvas: ^plutovg_canvas_t, line_width: f32) ---

	@(link_name = "plutovg_canvas_set_matrix")
	canvas_set_matrix :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_set_miter_limit")
	canvas_set_miter_limit :: proc(canvas: ^plutovg_canvas_t, miter_limit: f32) ---

	@(link_name = "plutovg_canvas_set_opacity")
	canvas_set_opacity :: proc(canvas: ^plutovg_canvas_t, opacity: f32) ---

	@(link_name = "plutovg_canvas_set_operator")
	canvas_set_operator :: proc(canvas: ^plutovg_canvas_t, op: plutovg_operator_t) ---

	@(link_name = "plutovg_canvas_set_paint")
	canvas_set_paint :: proc(canvas: ^plutovg_canvas_t, paint: ^plutovg_paint_t) ---

	@(link_name = "plutovg_canvas_set_radial_gradient")
	canvas_set_radial_gradient :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, cr: f32, fx: f32, fy: f32, fr: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_set_rgb")
	canvas_set_rgb :: proc(canvas: ^plutovg_canvas_t, r: f32, g: f32, b: f32) ---

	@(link_name = "plutovg_canvas_set_rgba")
	canvas_set_rgba :: proc(canvas: ^plutovg_canvas_t, r: f32, g: f32, b: f32, a: f32) ---

	@(link_name = "plutovg_canvas_set_texture")
	canvas_set_texture :: proc(canvas: ^plutovg_canvas_t, surface: ^plutovg_surface_t, type: plutovg_texture_type_t, opacity: f32, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_shear")
	canvas_shear :: proc(canvas: ^plutovg_canvas_t, shx: f32, shy: f32) ---

	@(link_name = "plutovg_canvas_stroke")
	canvas_stroke :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_stroke_extents")
	canvas_stroke_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_canvas_stroke_path")
	canvas_stroke_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	@(link_name = "plutovg_canvas_stroke_preserve")
	canvas_stroke_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	@(link_name = "plutovg_canvas_stroke_rect")
	canvas_stroke_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	@(link_name = "plutovg_canvas_stroke_text")
	canvas_stroke_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	@(link_name = "plutovg_canvas_text_extents")
	canvas_text_extents :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, extents: ^plutovg_rect_t) -> f32 ---

	@(link_name = "plutovg_canvas_transform")
	canvas_transform :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_canvas_translate")
	canvas_translate :: proc(canvas: ^plutovg_canvas_t, tx: f32, ty: f32) ---

	@(link_name = "plutovg_version")
	version :: proc() -> c.int ---

	@(link_name = "plutovg_version_string")
	version_string :: proc() -> cstring ---

	@(link_name = "plutovg_font_face_destroy")
	font_face_destroy :: proc(face: ^plutovg_font_face_t) ---

	@(link_name = "plutovg_font_face_get_glyph_metrics")
	font_face_get_glyph_metrics :: proc(face: ^plutovg_font_face_t, size: f32, codepoint: plutovg_codepoint_t, advance_width: ^f32, left_side_bearing: ^f32, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_font_face_get_glyph_path")
	font_face_get_glyph_path :: proc(face: ^plutovg_font_face_t, size: f32, x: f32, y: f32, codepoint: plutovg_codepoint_t, path: ^plutovg_path_t) -> f32 ---

	@(link_name = "plutovg_font_face_get_metrics")
	font_face_get_metrics :: proc(face: ^plutovg_font_face_t, size: f32, ascent: ^f32, descent: ^f32, line_gap: ^f32, extents: ^plutovg_rect_t) ---

	@(link_name = "plutovg_font_face_get_reference_count")
	font_face_get_reference_count :: proc(face: ^plutovg_font_face_t) -> c.int ---

	@(link_name = "plutovg_font_face_load_from_data")
	font_face_load_from_data :: proc(data: rawptr, length: c.uint, ttcindex: c.int, destroy_func: plutovg_destroy_func_t, closure: rawptr) -> ^plutovg_font_face_t ---

	@(link_name = "plutovg_font_face_load_from_file")
	font_face_load_from_file :: proc(filename: cstring, ttcindex: c.int) -> ^plutovg_font_face_t ---

	@(link_name = "plutovg_font_face_reference")
	font_face_reference :: proc(face: ^plutovg_font_face_t) -> ^plutovg_font_face_t ---

	@(link_name = "plutovg_font_face_text_extents")
	font_face_text_extents :: proc(face: ^plutovg_font_face_t, size: f32, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, extents: ^plutovg_rect_t) -> f32 ---

	@(link_name = "plutovg_font_face_traverse_glyph_path")
	font_face_traverse_glyph_path :: proc(face: ^plutovg_font_face_t, size: f32, x: f32, y: f32, codepoint: plutovg_codepoint_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) -> f32 ---

	@(link_name = "plutovg_text_iterator_has_next")
	text_iterator_has_next :: proc(it: ^plutovg_text_iterator_t) -> bool ---

	@(link_name = "plutovg_text_iterator_init")
	text_iterator_init :: proc(it: ^plutovg_text_iterator_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t) ---

	@(link_name = "plutovg_text_iterator_next")
	text_iterator_next :: proc(it: ^plutovg_text_iterator_t) -> plutovg_codepoint_t ---

	@(link_name = "plutovg_matrix_init")
	matrix_init :: proc(_matrix: ^plutovg_matrix_t, a: f32, b: f32, _c: f32, d: f32, e: f32, f: f32) ---

	@(link_name = "plutovg_color_init_argb32")
	color_init_argb32 :: proc(color: ^plutovg_color_t, value: c.uint) ---

	@(link_name = "plutovg_color_parse")
	color_parse :: proc(color: ^plutovg_color_t, data: cstring, length: c.int) -> c.int ---

	@(link_name = "plutovg_color_to_argb32")
	color_to_argb32 :: proc(color: ^plutovg_color_t) -> c.uint ---

	@(link_name = "plutovg_matrix_init_identity")
	matrix_init_identity :: proc(_matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_matrix_init_rotate")
	matrix_init_rotate :: proc(_matrix: ^plutovg_matrix_t, angle: f32) ---

	@(link_name = "plutovg_matrix_init_scale")
	matrix_init_scale :: proc(_matrix: ^plutovg_matrix_t, sx: f32, sy: f32) ---

	@(link_name = "plutovg_matrix_init_shear")
	matrix_init_shear :: proc(_matrix: ^plutovg_matrix_t, shx: f32, shy: f32) ---

	@(link_name = "plutovg_matrix_init_translate")
	matrix_init_translate :: proc(_matrix: ^plutovg_matrix_t, tx: f32, ty: f32) ---

	@(link_name = "plutovg_matrix_invert")
	matrix_invert :: proc(_matrix: ^plutovg_matrix_t, inverse: ^plutovg_matrix_t) -> bool ---

	@(link_name = "plutovg_matrix_map")
	matrix_map :: proc(_matrix: ^plutovg_matrix_t, x: f32, y: f32, xx: ^f32, yy: ^f32) ---

	@(link_name = "plutovg_matrix_map_point")
	matrix_map_point :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_point_t, dst: ^plutovg_point_t) ---

	@(link_name = "plutovg_matrix_map_points")
	matrix_map_points :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_point_t, dst: ^plutovg_point_t, count: c.int) ---

	@(link_name = "plutovg_matrix_map_rect")
	matrix_map_rect :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_rect_t, dst: ^plutovg_rect_t) ---

	@(link_name = "plutovg_matrix_multiply")
	matrix_multiply :: proc(_matrix: ^plutovg_matrix_t, left: ^plutovg_matrix_t, right: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_matrix_parse")
	matrix_parse :: proc(_matrix: ^plutovg_matrix_t, data: cstring, length: c.int) -> bool ---

	@(link_name = "plutovg_matrix_rotate")
	matrix_rotate :: proc(_matrix: ^plutovg_matrix_t, angle: f32) ---

	@(link_name = "plutovg_matrix_scale")
	matrix_scale :: proc(_matrix: ^plutovg_matrix_t, sx: f32, sy: f32) ---

	@(link_name = "plutovg_matrix_shear")
	matrix_shear :: proc(_matrix: ^plutovg_matrix_t, shx: f32, shy: f32) ---

	@(link_name = "plutovg_matrix_translate")
	matrix_translate :: proc(_matrix: ^plutovg_matrix_t, tx: f32, ty: f32) ---

	@(link_name = "plutovg_color_init_hsl")
	color_init_hsl :: proc(color: ^plutovg_color_t, h: f32, s: f32, l: f32) ---

	@(link_name = "plutovg_color_init_hsla")
	color_init_hsla :: proc(color: ^plutovg_color_t, h: f32, s: f32, l: f32, a: f32) ---

	@(link_name = "plutovg_color_init_rgb")
	color_init_rgb :: proc(color: ^plutovg_color_t, r: f32, g: f32, b: f32) ---

	@(link_name = "plutovg_color_init_rgb8")
	color_init_rgb8 :: proc(color: ^plutovg_color_t, r: c.int, g: c.int, b: c.int) ---

	@(link_name = "plutovg_color_init_rgba")
	color_init_rgba :: proc(color: ^plutovg_color_t, r: f32, g: f32, b: f32, a: f32) ---

	@(link_name = "plutovg_color_init_rgba32")
	color_init_rgba32 :: proc(color: ^plutovg_color_t, value: c.uint) ---

	@(link_name = "plutovg_color_init_rgba8")
	color_init_rgba8 :: proc(color: ^plutovg_color_t, r: c.int, g: c.int, b: c.int, a: c.int) ---

	@(link_name = "plutovg_color_to_rgba32")
	color_to_rgba32 :: proc(color: ^plutovg_color_t) -> c.uint ---

	@(link_name = "plutovg_paint_create_color")
	paint_create_color :: proc(color: ^plutovg_color_t) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_paint_create_linear_gradient")
	paint_create_linear_gradient :: proc() ---

	@(link_name = "plutovg_paint_create_radial_gradient")
	paint_create_radial_gradient :: proc(cx: f32, cy: f32, cr: f32, fx: f32, fy: f32, fr: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_paint_create_rgb")
	paint_create_rgb :: proc(r: f32, g: f32, b: f32) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_paint_create_rgba")
	paint_create_rgba :: proc(r: f32, g: f32, b: f32, a: f32) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_paint_create_texture")
	paint_create_texture :: proc(surface: ^plutovg_surface_t, type: plutovg_texture_type_t, opacity: f32, _matrix: ^plutovg_matrix_t) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_paint_destroy")
	paint_destroy :: proc(paint: ^plutovg_paint_t) ---

	@(link_name = "plutovg_paint_get_reference_count")
	paint_get_reference_count :: proc(paint: ^plutovg_paint_t) -> c.int ---

	@(link_name = "plutovg_paint_reference")
	paint_reference :: proc(paint: ^plutovg_paint_t) -> ^plutovg_paint_t ---

	@(link_name = "plutovg_path_add_arc")
	path_add_arc :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, r: f32, a0: f32, a1: f32, ccw: bool) ---

	@(link_name = "plutovg_path_add_circle")
	path_add_circle :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, r: f32) ---

	@(link_name = "plutovg_path_add_ellipse")
	path_add_ellipse :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, rx: f32, ry: f32) ---

	@(link_name = "plutovg_path_add_round_rect")
	path_add_round_rect :: proc(path: ^plutovg_path_t, x: f32, y: f32, w: f32, h: f32, rx: f32, ry: f32) ---

	@(link_name = "plutovg_path_arc_to")
	path_arc_to :: proc(path: ^plutovg_path_t, rx: f32, ry: f32, angle: f32, large_arc_flag: bool, sweep_flag: bool, x: f32, y: f32) ---

	@(link_name = "plutovg_path_clone")
	path_clone :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	@(link_name = "plutovg_path_clone_dashed")
	path_clone_dashed :: proc(path: ^plutovg_path_t, offset: f32, dashes: ^f32, ndashes: c.int) -> ^plutovg_path_t ---

	@(link_name = "plutovg_path_clone_flatten")
	path_clone_flatten :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	@(link_name = "plutovg_path_close")
	path_close :: proc(path: ^plutovg_path_t) ---

	@(link_name = "plutovg_path_create")
	path_create :: proc() -> ^plutovg_path_t ---

	@(link_name = "plutovg_path_cubic_to")
	path_cubic_to :: proc(path: ^plutovg_path_t, x1: f32, y1: f32, x2: f32, y2: f32, x3: f32, y3: f32) ---

	@(link_name = "plutovg_path_destroy")
	path_destroy :: proc(path: ^plutovg_path_t) ---

	@(link_name = "plutovg_path_extents")
	path_extents :: proc(path: ^plutovg_path_t, extents: ^plutovg_rect_t, tight: bool) -> f32 ---

	@(link_name = "plutovg_path_get_current_point")
	path_get_current_point :: proc(path: ^plutovg_path_t, x: ^f32, y: ^f32) ---

	@(link_name = "plutovg_path_get_elements")
	path_get_elements :: proc(path: ^plutovg_path_t, elements: ^^plutovg_path_element_t) -> c.int ---

	@(link_name = "plutovg_path_get_reference_count")
	path_get_reference_count :: proc(path: ^plutovg_path_t) -> c.int ---

	@(link_name = "plutovg_path_iterator_has_next")
	path_iterator_has_next :: proc(it: ^plutovg_path_iterator_t) -> bool ---

	@(link_name = "plutovg_path_iterator_init")
	path_iterator_init :: proc(it: ^plutovg_path_iterator_t, path: ^plutovg_path_t) ---

	@(link_name = "plutovg_path_iterator_next")
	path_iterator_next :: proc(it: ^plutovg_path_iterator_t, points: ^plutovg_point_t) -> plutovg_path_command_t ---

	@(link_name = "plutovg_path_length")
	path_length :: proc(path: ^plutovg_path_t) -> f32 ---

	@(link_name = "plutovg_path_line_to")
	path_line_to :: proc(path: ^plutovg_path_t, x: f32, y: f32) ---

	@(link_name = "plutovg_path_move_to")
	path_move_to :: proc(path: ^plutovg_path_t, x: f32, y: f32) ---

	@(link_name = "plutovg_path_parse")
	path_parse :: proc(path: ^plutovg_path_t, data: cstring, length: c.int) -> bool ---

	@(link_name = "plutovg_path_quad_to")
	path_quad_to :: proc(path: ^plutovg_path_t, x1: f32, y1: f32, x2: f32, y2: f32) ---

	@(link_name = "plutovg_path_reference")
	path_reference :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	@(link_name = "plutovg_path_reserve")
	path_reserve :: proc(path: ^plutovg_path_t, count: c.int) ---

	@(link_name = "plutovg_path_reset")
	path_reset :: proc(path: ^plutovg_path_t) ---

	@(link_name = "plutovg_path_transform")
	path_transform :: proc(path: ^plutovg_path_t, _matrix: ^plutovg_matrix_t) ---

	@(link_name = "plutovg_path_traverse")
	path_traverse :: proc(path: ^plutovg_path_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	@(link_name = "plutovg_path_traverse_dashed")
	path_traverse_dashed :: proc(path: ^plutovg_path_t, offset: f32, dashes: ^f32, ndashes: c.int, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	@(link_name = "plutovg_path_traverse_flatten")
	path_traverse_flatten :: proc(path: ^plutovg_path_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	@(link_name = "plutovg_convert_argb_to_rgba")
	convert_argb_to_rgba :: proc(dst: ^c.uchar, src: ^c.uchar, width: c.int, height: c.int, stride: c.int) ---

	@(link_name = "plutovg_convert_rgba_to_argb")
	convert_rgba_to_argb :: proc(dst: ^c.uchar, src: ^c.uchar, width: c.int, height: c.int, stride: c.int) ---

	@(link_name = "plutovg_surface_clear")
	surface_clear :: proc(surface: ^plutovg_surface_t, color: ^plutovg_color_t) ---

	@(link_name = "plutovg_surface_create")
	surface_create :: proc(width: c.int, height: c.int) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_create_for_data")
	surface_create_for_data :: proc(data: ^c.uchar, width: c.int, height: c.int, stride: c.int) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_destroy")
	surface_destroy :: proc(surface: ^plutovg_surface_t) ---

	@(link_name = "plutovg_surface_get_reference_count")
	surface_get_reference_count :: proc(surface: ^plutovg_surface_t) -> c.int ---

	@(link_name = "plutovg_surface_get_data")
	surface_get_data :: proc(surface: ^plutovg_surface_t) -> ^c.uchar ---

	@(link_name = "plutovg_surface_get_stride")
	surface_get_stride :: proc(surface: ^plutovg_surface_t) -> c.int ---

	@(link_name = "plutovg_surface_get_height")
	surface_get_height :: proc(surface: ^plutovg_surface_t) -> c.int ---

	@(link_name = "plutovg_surface_get_width")
	surface_get_width :: proc(surface: ^plutovg_surface_t) -> c.int ---

	@(link_name = "plutovg_surface_load_from_image_base64")
	surface_load_from_image_base64 :: proc(data: cstring, length: c.int) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_load_from_image_data")
	surface_load_from_image_data :: proc(data: rawptr, length: c.int) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_load_from_image_file")
	surface_load_from_image_file :: proc(filename: cstring) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_reference")
	surface_reference :: proc(surface: ^plutovg_surface_t) -> ^plutovg_surface_t ---

	@(link_name = "plutovg_surface_write_to_jpg")
	surface_write_to_jpg :: proc(surface: ^plutovg_surface_t, filename: cstring, quality: c.int) -> bool ---

	@(link_name = "plutovg_surface_write_to_jpg_stream")
	surface_write_to_jpg_stream :: proc(surface: ^plutovg_surface_t, write_func: plutovg_write_func_t, closure: rawptr, quality: c.int) -> bool ---

	@(link_name = "plutovg_surface_write_to_png")
	surface_write_to_png :: proc(surface: ^plutovg_surface_t, filename: cstring) -> bool ---

	@(link_name = "plutovg_surface_write_to_png_stream")
	surface_write_to_png_stream :: proc(surface: ^plutovg_surface_t, write_func: plutovg_write_func_t, closure: rawptr) -> bool ---

}
