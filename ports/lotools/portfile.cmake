# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 4ea5f931be167f9290140ecf90ba29065012d5c7 # 0.0.8
    SHA512 18b1c06adf2ba8599283bc7187dae9623f7c136ad5b4be5662b9e688218ba30f6e0916511df20166c350e75f89bc1bac5f431b10f5fd2a792b3f16a962b77f19
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

