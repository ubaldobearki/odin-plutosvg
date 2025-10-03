package odin_plutovg

import "core:c"

when ODIN_OS == .Linux {
	foreign import plutovg "../../lib/linux/libplutovg.a"
} else {
	#panic(true)
}

@(default_calling_convention = "c", link_prefix = "plutovg_")
foreign plutovg {

	canvas_add_glyph :: proc(canvas: ^plutovg_canvas_t, codepoint: plutovg_codepoint_t, x: f32, y: f32) -> f32 ---

	canvas_add_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	canvas_add_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	canvas_arc :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, r: f32, a0: f32, a1: f32, ccw: bool) ---

	canvas_arc_to :: proc(canvas: ^plutovg_canvas_t, rx: f32, ry: f32, angle: f32, large_arc_flag: bool, sweep_flag: bool, x: f32, y: f32) ---

	canvas_circle :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, r: f32) ---

	canvas_clip :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_clip_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	canvas_clip_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	canvas_clip_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_clip_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	canvas_clip_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	canvas_close_path :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_create :: proc(surface: ^plutovg_surface_t) -> ^plutovg_canvas_t ---

	canvas_cubic_to :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32, x3: f32, y3: f32) ---

	canvas_destroy :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_ellipse :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, rx: f32, ry: f32) ---

	canvas_fill :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_fill_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	canvas_fill_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	canvas_fill_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_fill_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	canvas_fill_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	canvas_font_metrics :: proc(canvas: ^plutovg_canvas_t, ascent: ^f32, descent: ^f32, line_gap: ^f32, extents: ^plutovg_rect_t) ---

	canvas_get_current_point :: proc(canvas: ^plutovg_canvas_t, x: ^f32, y: ^f32) ---

	canvas_get_dash_array :: proc(canvas: ^plutovg_canvas_t, dashes: ^^f32) -> c.int ---

	canvas_get_dash_offset :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	canvas_get_fill_rule :: proc(canvas: ^plutovg_canvas_t) -> plutovg_fill_rule_t ---

	canvas_get_font_face :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_font_face_t ---

	canvas_get_font_size :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	canvas_get_line_cap :: proc(canvas: ^plutovg_canvas_t) -> plutovg_line_cap_t ---

	canvas_get_line_join :: proc(canvas: ^plutovg_canvas_t) -> plutovg_line_join_t ---

	canvas_get_line_width :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	canvas_get_matrix :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	canvas_get_miter_limit :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	canvas_get_opacity :: proc(canvas: ^plutovg_canvas_t) -> f32 ---

	canvas_get_operator :: proc(canvas: ^plutovg_canvas_t) -> plutovg_operator_t ---

	canvas_get_paint :: proc(canvas: ^plutovg_canvas_t, color: ^plutovg_color_t) -> ^plutovg_paint_t ---

	canvas_get_path :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_path_t ---

	canvas_get_reference_count :: proc(canvas: ^plutovg_canvas_t) -> c.int ---

	canvas_get_surface :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_surface_t ---

	canvas_glyph_metrics :: proc(canvas: ^plutovg_canvas_t, codepoint: plutovg_codepoint_t, advance_width: ^f32, left_side_bearing: ^f32, extents: ^plutovg_rect_t) ---

	canvas_map :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, xx: ^f32, yy: ^f32) ---

	canvas_map_point :: proc(canvas: ^plutovg_canvas_t, src: ^plutovg_point_t, dst: ^plutovg_point_t) ---

	canvas_map_rect :: proc(canvas: ^plutovg_canvas_t, src: ^plutovg_rect_t, dst: ^plutovg_rect_t) ---

	canvas_move_to :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32) ---

	canvas_line_to :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32) ---

	canvas_new_path :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_paint :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_quad_to :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32) ---

	canvas_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	canvas_reference :: proc(canvas: ^plutovg_canvas_t) -> ^plutovg_canvas_t ---

	canvas_reset_matrix :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_restore :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_rotate :: proc(canvas: ^plutovg_canvas_t, angle: f32) ---

	canvas_round_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32, rx: f32, ry: f32) ---

	canvas_save :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_scale :: proc(canvas: ^plutovg_canvas_t, sx: f32, sy: f32) ---

	canvas_set_color :: proc(canvas: ^plutovg_canvas_t, color: ^plutovg_color_t) ---

	canvas_set_dash :: proc(canvas: ^plutovg_canvas_t, offset: f32, dashes: ^f32, ndashes: c.int) ---

	canvas_set_dash_array :: proc(canvas: ^plutovg_canvas_t, dashes: ^f32, ndashes: c.int) ---

	canvas_set_dash_offset :: proc(canvas: ^plutovg_canvas_t, offset: f32) ---

	canvas_set_fill_rule :: proc(canvas: ^plutovg_canvas_t, winding: plutovg_fill_rule_t) ---

	canvas_set_font :: proc(canvas: ^plutovg_canvas_t, face: ^plutovg_font_face_t, size: f32) ---

	canvas_set_font_face :: proc(canvas: ^plutovg_canvas_t, face: ^plutovg_font_face_t) ---

	canvas_set_font_size :: proc(canvas: ^plutovg_canvas_t, size: f32) ---

	canvas_set_linear_gradient :: proc(canvas: ^plutovg_canvas_t, x1: f32, y1: f32, x2: f32, y2: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) ---

	canvas_set_line_cap :: proc(canvas: ^plutovg_canvas_t, line_cap: plutovg_line_cap_t) ---

	canvas_set_line_join :: proc(canvas: ^plutovg_canvas_t, line_join: plutovg_line_join_t) ---

	canvas_set_line_width :: proc(canvas: ^plutovg_canvas_t, line_width: f32) ---

	canvas_set_matrix :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	canvas_set_miter_limit :: proc(canvas: ^plutovg_canvas_t, miter_limit: f32) ---

	canvas_set_opacity :: proc(canvas: ^plutovg_canvas_t, opacity: f32) ---

	canvas_set_operator :: proc(canvas: ^plutovg_canvas_t, op: plutovg_operator_t) ---

	canvas_set_paint :: proc(canvas: ^plutovg_canvas_t, paint: ^plutovg_paint_t) ---

	canvas_set_radial_gradient :: proc(canvas: ^plutovg_canvas_t, cx: f32, cy: f32, cr: f32, fx: f32, fy: f32, fr: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) ---

	canvas_set_rgb :: proc(canvas: ^plutovg_canvas_t, r: f32, g: f32, b: f32) ---

	canvas_set_rgba :: proc(canvas: ^plutovg_canvas_t, r: f32, g: f32, b: f32, a: f32) ---

	canvas_set_texture :: proc(canvas: ^plutovg_canvas_t, surface: ^plutovg_surface_t, type: plutovg_texture_type_t, opacity: f32, _matrix: ^plutovg_matrix_t) ---

	canvas_shear :: proc(canvas: ^plutovg_canvas_t, shx: f32, shy: f32) ---

	canvas_stroke :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_stroke_extents :: proc(canvas: ^plutovg_canvas_t, extents: ^plutovg_rect_t) ---

	canvas_stroke_path :: proc(canvas: ^plutovg_canvas_t, path: ^plutovg_path_t) ---

	canvas_stroke_preserve :: proc(canvas: ^plutovg_canvas_t) ---

	canvas_stroke_rect :: proc(canvas: ^plutovg_canvas_t, x: f32, y: f32, w: f32, h: f32) ---

	canvas_stroke_text :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, x: f32, y: f32) -> f32 ---

	canvas_text_extents :: proc(canvas: ^plutovg_canvas_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, extents: ^plutovg_rect_t) -> f32 ---

	canvas_transform :: proc(canvas: ^plutovg_canvas_t, _matrix: ^plutovg_matrix_t) ---

	canvas_translate :: proc(canvas: ^plutovg_canvas_t, tx: f32, ty: f32) ---

	version :: proc() -> c.int ---

	version_string :: proc() -> cstring ---

	font_face_destroy :: proc(face: ^plutovg_font_face_t) ---

	font_face_get_glyph_metrics :: proc(face: ^plutovg_font_face_t, size: f32, codepoint: plutovg_codepoint_t, advance_width: ^f32, left_side_bearing: ^f32, extents: ^plutovg_rect_t) ---

	font_face_get_glyph_path :: proc(face: ^plutovg_font_face_t, size: f32, x: f32, y: f32, codepoint: plutovg_codepoint_t, path: ^plutovg_path_t) -> f32 ---

	font_face_get_metrics :: proc(face: ^plutovg_font_face_t, size: f32, ascent: ^f32, descent: ^f32, line_gap: ^f32, extents: ^plutovg_rect_t) ---

	font_face_get_reference_count :: proc(face: ^plutovg_font_face_t) -> c.int ---

	font_face_load_from_data :: proc(data: rawptr, length: c.uint, ttcindex: c.int, destroy_func: plutovg_destroy_func_t, closure: rawptr) -> ^plutovg_font_face_t ---

	font_face_load_from_file :: proc(filename: cstring, ttcindex: c.int) -> ^plutovg_font_face_t ---

	font_face_reference :: proc(face: ^plutovg_font_face_t) -> ^plutovg_font_face_t ---

	font_face_text_extents :: proc(face: ^plutovg_font_face_t, size: f32, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t, extents: ^plutovg_rect_t) -> f32 ---

	font_face_traverse_glyph_path :: proc(face: ^plutovg_font_face_t, size: f32, x: f32, y: f32, codepoint: plutovg_codepoint_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) -> f32 ---

	text_iterator_has_next :: proc(it: ^plutovg_text_iterator_t) -> bool ---

	text_iterator_init :: proc(it: ^plutovg_text_iterator_t, text: rawptr, length: c.int, encoding: plutovg_text_encoding_t) ---

	text_iterator_next :: proc(it: ^plutovg_text_iterator_t) -> plutovg_codepoint_t ---

	matrix_init :: proc(_matrix: ^plutovg_matrix_t, a: f32, b: f32, _c: f32, d: f32, e: f32, f: f32) ---

	color_init_argb32 :: proc(color: ^plutovg_color_t, value: c.uint) ---

	color_parse :: proc(color: ^plutovg_color_t, data: cstring, length: c.int) -> c.int ---

	color_to_argb32 :: proc(color: ^plutovg_color_t) -> c.uint ---

	matrix_init_identity :: proc(_matrix: ^plutovg_matrix_t) ---

	matrix_init_rotate :: proc(_matrix: ^plutovg_matrix_t, angle: f32) ---

	matrix_init_scale :: proc(_matrix: ^plutovg_matrix_t, sx: f32, sy: f32) ---

	matrix_init_shear :: proc(_matrix: ^plutovg_matrix_t, shx: f32, shy: f32) ---

	matrix_init_translate :: proc(_matrix: ^plutovg_matrix_t, tx: f32, ty: f32) ---

	matrix_invert :: proc(_matrix: ^plutovg_matrix_t, inverse: ^plutovg_matrix_t) -> bool ---

	matrix_map :: proc(_matrix: ^plutovg_matrix_t, x: f32, y: f32, xx: ^f32, yy: ^f32) ---

	matrix_map_point :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_point_t, dst: ^plutovg_point_t) ---

	matrix_map_points :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_point_t, dst: ^plutovg_point_t, count: c.int) ---

	matrix_map_rect :: proc(_matrix: ^plutovg_matrix_t, src: ^plutovg_rect_t, dst: ^plutovg_rect_t) ---

	matrix_multiply :: proc(_matrix: ^plutovg_matrix_t, left: ^plutovg_matrix_t, right: ^plutovg_matrix_t) ---

	matrix_parse :: proc(_matrix: ^plutovg_matrix_t, data: cstring, length: c.int) -> bool ---

	matrix_rotate :: proc(_matrix: ^plutovg_matrix_t, angle: f32) ---

	matrix_scale :: proc(_matrix: ^plutovg_matrix_t, sx: f32, sy: f32) ---

	matrix_shear :: proc(_matrix: ^plutovg_matrix_t, shx: f32, shy: f32) ---

	matrix_translate :: proc(_matrix: ^plutovg_matrix_t, tx: f32, ty: f32) ---

	color_init_hsl :: proc(color: ^plutovg_color_t, h: f32, s: f32, l: f32) ---

	color_init_hsla :: proc(color: ^plutovg_color_t, h: f32, s: f32, l: f32, a: f32) ---

	color_init_rgb :: proc(color: ^plutovg_color_t, r: f32, g: f32, b: f32) ---

	color_init_rgb8 :: proc(color: ^plutovg_color_t, r: c.int, g: c.int, b: c.int) ---

	color_init_rgba :: proc(color: ^plutovg_color_t, r: f32, g: f32, b: f32, a: f32) ---

	color_init_rgba32 :: proc(color: ^plutovg_color_t, value: c.uint) ---

	color_init_rgba8 :: proc(color: ^plutovg_color_t, r: c.int, g: c.int, b: c.int, a: c.int) ---

	color_to_rgba32 :: proc(color: ^plutovg_color_t) -> c.uint ---

	paint_create_color :: proc(color: ^plutovg_color_t) -> ^plutovg_paint_t ---

	paint_create_linear_gradient :: proc() ---

	paint_create_radial_gradient :: proc(cx: f32, cy: f32, cr: f32, fx: f32, fy: f32, fr: f32, spread: plutovg_spread_method_t, stops: ^plutovg_gradient_stop_t, nstops: c.int, _matrix: ^plutovg_matrix_t) -> ^plutovg_paint_t ---

	paint_create_rgb :: proc(r: f32, g: f32, b: f32) -> ^plutovg_paint_t ---

	paint_create_rgba :: proc(r: f32, g: f32, b: f32, a: f32) -> ^plutovg_paint_t ---

	paint_create_texture :: proc(surface: ^plutovg_surface_t, type: plutovg_texture_type_t, opacity: f32, _matrix: ^plutovg_matrix_t) -> ^plutovg_paint_t ---

	paint_destroy :: proc(paint: ^plutovg_paint_t) ---

	paint_get_reference_count :: proc(paint: ^plutovg_paint_t) -> c.int ---

	paint_reference :: proc(paint: ^plutovg_paint_t) -> ^plutovg_paint_t ---

	path_add_arc :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, r: f32, a0: f32, a1: f32, ccw: bool) ---

	path_add_circle :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, r: f32) ---

	path_add_ellipse :: proc(path: ^plutovg_path_t, cx: f32, cy: f32, rx: f32, ry: f32) ---

	path_add_round_rect :: proc(path: ^plutovg_path_t, x: f32, y: f32, w: f32, h: f32, rx: f32, ry: f32) ---

	path_arc_to :: proc(path: ^plutovg_path_t, rx: f32, ry: f32, angle: f32, large_arc_flag: bool, sweep_flag: bool, x: f32, y: f32) ---

	path_clone :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	path_clone_dashed :: proc(path: ^plutovg_path_t, offset: f32, dashes: ^f32, ndashes: c.int) -> ^plutovg_path_t ---

	path_clone_flatten :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	path_close :: proc(path: ^plutovg_path_t) ---

	path_create :: proc() -> ^plutovg_path_t ---

	path_cubic_to :: proc(path: ^plutovg_path_t, x1: f32, y1: f32, x2: f32, y2: f32, x3: f32, y3: f32) ---

	path_destroy :: proc(path: ^plutovg_path_t) ---

	path_extents :: proc(path: ^plutovg_path_t, extents: ^plutovg_rect_t, tight: bool) -> f32 ---

	path_get_current_point :: proc(path: ^plutovg_path_t, x: ^f32, y: ^f32) ---

	path_get_elements :: proc(path: ^plutovg_path_t, elements: ^^plutovg_path_element_t) -> c.int ---

	path_get_reference_count :: proc(path: ^plutovg_path_t) -> c.int ---

	path_iterator_has_next :: proc(it: ^plutovg_path_iterator_t) -> bool ---

	path_iterator_init :: proc(it: ^plutovg_path_iterator_t, path: ^plutovg_path_t) ---

	path_iterator_next :: proc(it: ^plutovg_path_iterator_t, points: ^plutovg_point_t) -> plutovg_path_command_t ---

	path_length :: proc(path: ^plutovg_path_t) -> f32 ---

	path_line_to :: proc(path: ^plutovg_path_t, x: f32, y: f32) ---

	path_move_to :: proc(path: ^plutovg_path_t, x: f32, y: f32) ---

	path_parse :: proc(path: ^plutovg_path_t, data: cstring, length: c.int) -> bool ---

	path_quad_to :: proc(path: ^plutovg_path_t, x1: f32, y1: f32, x2: f32, y2: f32) ---

	path_reference :: proc(path: ^plutovg_path_t) -> ^plutovg_path_t ---

	path_reserve :: proc(path: ^plutovg_path_t, count: c.int) ---

	path_reset :: proc(path: ^plutovg_path_t) ---

	path_transform :: proc(path: ^plutovg_path_t, _matrix: ^plutovg_matrix_t) ---

	path_traverse :: proc(path: ^plutovg_path_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	path_traverse_dashed :: proc(path: ^plutovg_path_t, offset: f32, dashes: ^f32, ndashes: c.int, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	path_traverse_flatten :: proc(path: ^plutovg_path_t, traverse_func: plutovg_path_traverse_func_t, closure: rawptr) ---

	convert_argb_to_rgba :: proc(dst: ^c.uchar, src: ^c.uchar, width: c.int, height: c.int, stride: c.int) ---

	convert_rgba_to_argb :: proc(dst: ^c.uchar, src: ^c.uchar, width: c.int, height: c.int, stride: c.int) ---

	surface_clear :: proc(surface: ^plutovg_surface_t, color: ^plutovg_color_t) ---

	surface_create :: proc(width: c.int, height: c.int) -> ^plutovg_surface_t ---

	surface_create_for_data :: proc(data: ^c.uchar, width: c.int, height: c.int, stride: c.int) -> ^plutovg_surface_t ---

	surface_destroy :: proc(surface: ^plutovg_surface_t) ---

	surface_get_reference_count :: proc(surface: ^plutovg_surface_t) -> c.int ---

	surface_get_data :: proc(surface: ^plutovg_surface_t) -> ^c.uchar ---

	surface_get_stride :: proc(surface: ^plutovg_surface_t) -> c.int ---

	surface_get_height :: proc(surface: ^plutovg_surface_t) -> c.int ---

	surface_get_width :: proc(surface: ^plutovg_surface_t) -> c.int ---

	surface_load_from_image_base64 :: proc(data: cstring, length: c.int) -> ^plutovg_surface_t ---

	surface_load_from_image_data :: proc(data: rawptr, length: c.int) -> ^plutovg_surface_t ---

	surface_load_from_image_file :: proc(filename: cstring) -> ^plutovg_surface_t ---

	surface_reference :: proc(surface: ^plutovg_surface_t) -> ^plutovg_surface_t ---

	surface_write_to_jpg :: proc(surface: ^plutovg_surface_t, filename: cstring, quality: c.int) -> bool ---

	surface_write_to_jpg_stream :: proc(surface: ^plutovg_surface_t, write_func: plutovg_write_func_t, closure: rawptr, quality: c.int) -> bool ---

	surface_write_to_png :: proc(surface: ^plutovg_surface_t, filename: cstring) -> bool ---

	surface_write_to_png_stream :: proc(surface: ^plutovg_surface_t, write_func: plutovg_write_func_t, closure: rawptr) -> bool ---

}
