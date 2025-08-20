package test

import "core:fmt"
import svg "plutosvg"
import vg "plutosvg/plutovg"

main :: proc() {
	image_width: i32 = 512
	image_height: i32 = 266

	document := svg.document_load_from_file(
		"odin_logo.svg",
		cast(f32)image_width,
		cast(f32)image_height,
	)

	if document == nil {
		fmt.println("Unable to load SVG file.")
		return
	}

	surface := svg.document_render_to_surface(
		document,
		nil,
		image_width,
		image_height,
		nil,
		nil,
		nil,
	)
	vg.surface_write_to_png(surface, "odin_logo.png")
	svg.document_destroy(document)
	vg.surface_destroy(surface)
}
