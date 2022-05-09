# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 63a0098f947fe2424ec0aff16fe1f20abb732934 # 0.1.0
    SHA512 5c8f1b74a387aec0595ae0fd630d4167a9d0b15fbdd83258fc450425f8740a508fc8413ae04f4e6534cdaa32809119252ba8cd2d270ecdbc6b3362668f5692b6
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

