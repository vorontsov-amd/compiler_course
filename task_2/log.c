#include <stdio.h>

void instLoger(const char *inst, const char *user) {
  if (user == NULL) {
    printf("%s\n", inst);
  } else {
    printf("%s<-%s\n", inst, user);
  }
}