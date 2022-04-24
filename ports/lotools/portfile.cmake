# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF cc31e3f54e695bef02c4c28874e967ee8bf24e62 # 0.0.4
    SHA512 c1abebfe4c75a41e9c70b933b917214e1084a1d10ab6919c2c4eede24f9e672bee36d197f63aa7e6c86b0776b500cc6c2d5ab0fed12ad2c5fa6d83d67ecae9d6
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

