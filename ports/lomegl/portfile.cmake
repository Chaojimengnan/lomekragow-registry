# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lomegl
    REF 3ab8827cad6e942a774e31953192ac3a789167fb # 0.0.3
    SHA512 47153dd6c0a827862bd7db785492ecfa29b300cbf86145d4e53dd1285d2984316d1a927f3467122b30765812180d4a57deb8472734c1a5fea88b286525982517
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