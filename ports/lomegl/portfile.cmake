# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lomegl
    REF f4e2d3f022af956b4fe4492818d961c9af4a1414 # 0.1.0
    SHA512 64759c47ea07a16a94798ce4082db6c18c111e2aa713f51070f03ac472b409d84111b0a7e3fe01c4da1bb8e4d82b095ac9d311244cc98105515fdc514611610a
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