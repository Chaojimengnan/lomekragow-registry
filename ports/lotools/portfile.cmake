# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 09f68349a8abcf9f30d12418687a9d2c0480f022 # 0.0.2
    SHA512 656f5a58b87c92f07271adc9d77b8a629659f7812e81079e4e4a3d4e012086ff61de78b50f484a36eb07cbfc87393080d4f45e1158f2920c0b81c335364f5b21
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

