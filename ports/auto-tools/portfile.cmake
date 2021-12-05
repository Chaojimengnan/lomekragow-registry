vcpkg_check_linkage(ONLY_DYNAMIC_CRT)   # 强制使用动态CRT

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/auto-tools
    REF 1aacedd7520ae68aa8b0473edefa917cbefd9dcc # 0.0.2
    SHA512 6c61960528e78ccfc0c12fa3ce98befb624ff3e24596b7cec382a64866bf179e2502da8029740065bf186b446d32acefd316092bc2e7551331475178f5e02bf8
    HEAD_REF master
)

# 构建和安装基于msbuild的项目
vcpkg_install_msbuild(
    SOURCE_PATH ${SOURCE_PATH}                 
    PROJECT_SUBPATH msvc/auto-tools-lib.vcxproj
    INCLUDES_SUBPATH include
    LICENSE_SUBPATH LICENSE
    USE_VCPKG_INTEGRATION
    ALLOW_ROOT_INCLUDES
)

# 复制许可证
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

vcpkg_copy_pdbs()