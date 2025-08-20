package odin_plutosvg

import "core:c"

when ODIN_OS == .Linux {
    foreign import plutosvg "../lib/linuxbsd/libplutosvg.a"
} else {
    #panic(true)
}

@(default_calling_convention = "c")
foreign plutosvg {

@(link_name = "plutosvg_document_destroy")
document_destroy :: proc(document: ^plutosvg_document_t) ---

@(link_name = "plutosvg_document_extents")
document_extents :: proc(document: ^plutosvg_document_t, id: cstring, extents: ^plutovg_rect_t) -> bool---

@(link_name = "plutosvg_document_get_height")
document_get_height :: proc(document: ^plutosvg_document_t) -> f32 ---

@(link_name = "plutosvg_document_get_width")
document_get_width :: proc(document: ^plutosvg_document_t) -> f32 ---

@(link_name = "plutosvg_document_load_from_data")
document_load_from_data :: proc(data: cstring, length: c.int, width: f32, height: f32, destroy_func: plutovg_destroy_func_t, closure: rawptr) ->  ^plutosvg_document_t ---

@(link_name = "plutosvg_document_load_from_file")
document_load_from_file :: proc(filename: cstring, width: f32, height: f32) -> ^plutosvg_document_t ---

@(link_name = "plutosvg_document_render")
document_render :: proc(document: ^plutosvg_document_t, id: cstring, canvas: ^plutovg_canvas_t, current_color: ^plutovg_color_t, palette_func: plutosvg_palette_func_t, closure: rawptr) -> bool ---

@(link_name = "plutosvg_document_render_to_surface")
document_render_to_surface :: proc(document: ^plutosvg_document_t, id: cstring, width: c.int, height: c.int, current_color: ^plutovg_color_t, palette_func: plutosvg_palette_func_t, closure: rawptr) -> ^plutovg_surface_t ---

@(link_name = "plutosvg_ft_svg_hooks")
ft_svg_hooks :: proc() -> rawptr ---

@(link_name = "plutosvg_version")
plutosvg_version :: proc() -> c.int ---

@(link_name = "plutosvg_version_string")
plutosvg_version_string :: proc() -> cstring ---

}

