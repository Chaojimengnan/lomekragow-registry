# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lomegl
    REF aaf4ad4a810122f5d1415f19c0aa5d27abe6ebbb # 0.0.2
    SHA512 490f1d9366ac4f04449c193ab943265a4aab0c1365fb2344d8b51d51a9e9be2c2df22998577f1a0bbca93cffd56e72d7cc1e799286135d3099d54376c2bcee43
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