vcpkg_check_linkage(ONLY_DYNAMIC_CRT)   # 强制使用动态CRT

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/auto-tools
    REF 316bd4279ddae4745499c869763faf759fd7a3d3 # 0.0.1
    SHA512 bb625121c4e6760e471c889a68f7295f971461c79c57a913bd56f6882c64894247cb7f47e4b130371b98fbfe4242093cf6460c864f90a602319ec42e4c2681c9
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