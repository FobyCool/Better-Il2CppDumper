#include "pkg.h"

std::string readTargetPackage() {
    std::string path = "/data/adb/modules/zygisk_il2cppdumper/target_package.txt";
    std::ifstream file(path);
    std::string pkg;
    
    if (file.is_open()) {
        std::getline(file, pkg);
        file.close();
        return pkg;
    }
    
    return "";
}
