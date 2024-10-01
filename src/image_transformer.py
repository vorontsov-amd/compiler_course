from PIL import Image

def png_to_ppm_p3(png_path, ppm_path):
    """Converts a PNG image to PPM format (P3 type).

    Args:
      png_path: Path to the input PNG file.
      ppm_path: Path to the output PPM file.
    """

    # Open the PNG image
    img = Image.open(png_path)

    # Convert to RGB mode if necessary
    if img.mode != "RGB":
        img = img.convert("RGB")

    # Get image dimensions
    width, height = img.size

    # Create the PPM header
    header = f"P3\n{width} {height}\n"

    # Convert pixel data to strings
    pixel_data = ""
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))
            pixel_data += f"{str(r)} {str(g)} {str(b)}\n"

    # Write the PPM data to file
    with open(ppm_path, "w") as f:
        f.write(header)
        f.write(pixel_data)


def open_ppm_p3(ppm_path):
    """Opens a PPM P3 file and displays it using PIL.

    Args:
      ppm_path: Path to the PPM P3 file.
    """

    # Read the PPM file contents
    with open(ppm_path, "r") as f:
        ppm_data = f.read()

    # Parse the header
    lines = ppm_data.splitlines()
    magic_number = lines[0]
    width, height = map(int, lines[1].split())

    # Extract pixel data
    pixel_data = lines[3:]
    pixels = []
    for line in pixel_data:
        values = line.split()
        for i in range(0, len(values), 3):
            r, g, b = map(int, values[i:i+3])
            pixels.append((r, g, b))

    # Create a PIL Image object
    img = Image.new("RGB", (width, height))
    img.putdata(pixels)

    # Display the image
    img.show()

if __name__ == "__main__":
    # Path to your PNG image
    image_path = "../images/1/normal/blue.png"
    ppm_path = "../output.ppm"
    # png_to_ppm_p3(image_path, ppm_path)
    open_ppm_p3(ppm_path)


