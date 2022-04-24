# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 79eb257fe5f03c96aa7139b4bedf52be7b04eeaf # 0.0.3
    SHA512 de1b75823790dfee49a06f1c87c52dd366528914aa1bd545214ed9fdb0dfadc2c580835d1e31833bea1358a75d833d5eb67b628a51208518ec882413bac510c8
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

