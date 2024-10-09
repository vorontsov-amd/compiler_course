#include "sdl.h"
#include <random>
#include <cstdio>
#include <algorithm>

enum color : uint32_t {
    eBlue    = 0x000000FF,
    eCyan    = 0x0000FFFF,
    eGreen   = 0x0000FF00,
    eMagenta = 0x00FF00FF,
    eOrange  = 0x00FF7F00,
    ePurple  = 0x007F00FF,
    eRed     = 0x00FF0000,
    eYellow  = 0x00FFFF00,
};

struct Vector {
    int x = 0;
    int y = 0;

    static Vector rand(int min_x, int max_x, int min_y, int max_y) {
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> distrib_x(min_x, max_x);
        std::uniform_int_distribution<> distrib_y(min_y, max_y);
        return Vector{distrib_x(gen), distrib_y(gen)};
    }
};

struct Image {
    int x = 0;
    int y = 0;
    int width = 0;
    int height = 0;
    int color = 0;
    int* data = nullptr;

    Image() = default;
    explicit Image(const char* filename) {
        auto file = fopen(filename, "r");
        if (file == nullptr) {
            printf("Could not open file %s\n", filename);
        }

        auto scaned = fscanf(file, "%*s %d %d", &width, &height);
        if (scaned != 2) {
            printf("Could not read file %s (1)\n", filename);
        }

        data = new (std::nothrow) int[width * height];
        if (data == nullptr) {
            printf("Could not allocate memory for image\n");
        }

        for (int i = 0; i < width * height; i++) {
            int r = 0, g = 0, b = 0;
            scaned = fscanf(file, "%d %d %d", &r,  &g, &b);
            if (scaned != 3) {
                printf("Could not read file %s (2)\n", filename);
            }
            data[i] = (r << 16) | (g << 8) | b;
            if (data[i] != 0) {
                color = data[i];
            }
        }
        fclose(file);
    }

    void print() const {
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                auto has_color = data[j * width + i];
                auto x = this->x + i;
                auto y = this->y + j;
                if (has_color != 0) {
                    simPutPixel(x, y, color);
                }
            }
        }
    }

    ~Image() {
        delete[] data;
    }
};

int main(int argc, const char *argv[]) {
    simInit();
    constexpr color COLORS[] = {color::eBlue,   color::eCyan,   color::eGreen, color::eMagenta,
                                color::eOrange, color::ePurple, color::eRed,   color::eYellow};
    constexpr size_t COLOR_COUNT = std::size(COLORS);

    auto image = Image("../images/ppm/output.ppm");
    auto point = Vector::rand(500, 700, 500, 700);
    auto speed = Vector{10,10};
    image.x = point.x;
    image.y = point.y;

    int dx = 1, dy = 1, color = 0;
    while (true) {
        if (!(0 <= image.x && image.x + image.width < WINDOW_WIDTH)) {
            image.x = std::clamp(image.x, 0, WINDOW_WIDTH - image.width - 1);
            speed.x = -speed.x;
            image.color = COLORS[color++ % COLOR_COUNT];
        }
        if (!(0 <= image.y && image.y + image.height < WINDOW_HEIGHT)) {
            image.y = std::clamp(image.y, 0, WINDOW_HEIGHT - image.height - 1);
            speed.y = -speed.y;
            image.color = COLORS[color++ % COLOR_COUNT];
        }
        simClearWindow();
        image.print();
        simFlush();

        image.x += speed.x * dx;
        image.y += speed.y * dy;
    }
    simExit();
    return 0;
}