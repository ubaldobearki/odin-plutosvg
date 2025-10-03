package odin_plutosvg

import "core:c"

when ODIN_OS == .Linux {
    foreign import plutosvg "../lib/linux/libplutosvg.a"
} else {
    #panic(true)
}

@(default_calling_convention = "c", link_prefix = "plutosvg_")
foreign plutosvg {

document_destroy :: proc(document: ^plutosvg_document_t) ---

document_extents :: proc(document: ^plutosvg_document_t, id: cstring, extents: ^plutovg_rect_t) -> bool---

document_get_height :: proc(document: ^plutosvg_document_t) -> f32 ---

document_get_width :: proc(document: ^plutosvg_document_t) -> f32 ---

document_load_from_data :: proc(data: cstring, length: c.int, width: f32, height: f32, destroy_func: plutovg_destroy_func_t, closure: rawptr) ->  ^plutosvg_document_t ---

document_load_from_file :: proc(filename: cstring, width: f32, height: f32) -> ^plutosvg_document_t ---

document_render :: proc(document: ^plutosvg_document_t, id: cstring, canvas: ^plutovg_canvas_t, current_color: ^plutovg_color_t, palette_func: plutosvg_palette_func_t, closure: rawptr) -> bool ---

document_render_to_surface :: proc(document: ^plutosvg_document_t, id: cstring, width: c.int, height: c.int, current_color: ^plutovg_color_t, palette_func: plutosvg_palette_func_t, closure: rawptr) -> ^plutovg_surface_t ---

ft_svg_hooks :: proc() -> rawptr ---

version :: proc() -> c.int ---

version_string :: proc() -> cstring ---

}

