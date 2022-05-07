# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF ea49d0d4e22280ec00f27b3bb6c6b0a5456f9533 # 0.0.7
    SHA512 69fa428b6c119835f7205981780658ce143ec02beb002001dfd13af3b831b259c7ccce43ce3fbca333dda280bb6e1a8ef2cfd2feb416cad418d8ff53f7b17074
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

