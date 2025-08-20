package odin_plutosvg

import "core:c"
import "plutovg"

plutovg_rect_t :: plutovg.plutovg_rect_t
plutovg_destroy_func_t :: plutovg.plutovg_destroy_func_t
plutovg_canvas_t :: plutovg.plutovg_canvas_t
plutovg_color_t :: plutovg.plutovg_color_t
plutovg_surface_t :: plutovg.plutovg_surface_t
plutovg_path_t :: plutovg.plutovg_path_t

plutosvg_palette_func_t :: proc "c" (rawptr, cstring, c.int, ^plutovg_color_t) -> bool

string_t ::struct {
    data: cstring,
    length: c.size_t
}

attribute_t :: struct {
    id: c.int,
    value: string_t,
    next: ^attribute_t
}

element_t :: struct {
    id: c.int,
    parent: ^element_t,
    last_child: ^element_t,
    first_child: ^element_t,
    next_sibling: ^element_t,
    attributes: ^attribute_t
}

heap_chunk_t :: struct {
  next: ^heap_chunk_t
}

heap_t :: struct {
  chunk: ^heap_chunk_t,
  size: c.size_t
}

hashmap_entry_t :: struct {
    hash: c.size_t,
    name: string_t,
    value: rawptr,
    next: ^hashmap_entry_t
}

hashmap_t :: struct {
    buckets: ^^hashmap_entry_t,
    size: c.size_t,
    capacity: c.size_t
}

plutosvg_document_t :: struct {
    heap: ^heap_t,
    path: ^plutovg_path_t,
    id_cache: ^hashmap_t,
    root_element: ^element_t,
    destroy_func: plutovg_destroy_func_t,
    closure: rawptr,
    width: c.float,
    height: c.float
}
