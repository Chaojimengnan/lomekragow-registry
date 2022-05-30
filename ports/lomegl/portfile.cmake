# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lomegl
    REF bac257e6b26f3646f3c0f501c8da490f849fa71a # 0.0.1
    SHA512 e6abae724aec1c5f81fd280ceaf758e8a018475ca636b6e427713033abb45c04cbbf206aa3f86af19416eb8594f38fc08d6f7c537f43dc31782298c0e9a6a394
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