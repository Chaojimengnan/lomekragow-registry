# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lomegl
    REF 3e13e191728ba9a486e3d08187b12c92de3a06c0 # 0.0.4
    SHA512 277a72a12fed7d80e7427dcfffc49790b0d8c7316a852f206a30eec1df0413bb7cb51b6b1f78e73f51368c55b2e614bd06602d6a518a4edca076abbb630a1af1
    HEAD_REF master
)

# 检查feature
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        glfw       LOMEGL_USE_GLFW
)

# 配置cmake
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}          # 之前获取的feature列表
        -DLOMEGL_BUILD_TEST=OFF     # 不编译测试代码
)

# 构建并安装
vcpkg_install_cmake()

# 修正配置文件
vcpkg_fixup_cmake_targets()

# 生成的库分为debug和release，但是头文件仅需要保留一份，所以删除debug/include
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)