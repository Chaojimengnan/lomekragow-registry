vcpkg_check_linkage(ONLY_DYNAMIC_CRT)   # 强制使用动态CRT

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/auto-tools
    REF badeecc0a82e74a29064b882a04bed7410396bca # 0.0.3
    SHA512 524a6c56f97de59f9d7b814a63c0e0b2b68ce21c57536204a817bba209d776c536f62171df2bee97a0b3df6659ddfce0cdfa6f01807ff925a7f6cee92c0769f7
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