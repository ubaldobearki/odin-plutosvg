# odin-plutosvg

[odin](https://github.com/odin-lang/Odin) bindings for the [PlutoSVG](https://github.com/sammycage/plutosvg) SVG library ([PlutoVG](https://github.com/sammycage/plutovg) bindings included!)

> [!IMPORTANT]  
> This bindings are an alpha release and still being tested, make sure to submit a PR if you encountered any issues!

## Supported Platforms
- [x] Linux
- [ ] MacOS (In the works!)
- [ ] Windows (In the works!)

## Example
```odin
import "core:fmt"
import svg "plutosvg"
import vg "plutosvg/plutovg"

main :: proc() {
	image_height: i32 = 512
	image_width: i32 = 266

	document := svg.document_load_from_file(
		"odin_logo.svg",
		cast(f32)image_height,
		cast(f32)image_width,
	)

	if document == nil {
		fmt.println("Unable to load SVG file.")
		return
	}

	surface := svg.document_render_to_surface(
		document,
		nil,
		image_height,
		image_width,
		nil,
		nil,
		nil,
	)
	vg.surface_write_to_png(surface, "odin_logo.png")
	svg.document_destroy(document)
	vg.surface_destroy(surface)
}
```
