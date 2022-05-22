# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 3ebd29b45d71f22be68185300e4a48d641146755 # 0.1.2
    SHA512 ace1efb2d9dc588ae5e2478a2dacbd5a5a09bc58f1663304bac88d3b1bcb9787465b1a2a12b808e645808583a6b0c7e923e852be48619e8351ef4fecf40383e5
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

