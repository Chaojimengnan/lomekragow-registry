# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 404ac4f8d68ec2a26167e266604d217276e5ece1 # 0.0.1
    SHA512 aa157648b99fcc79677f49d174f0812844cd49a54dbabe00435151e151456172d94baa64463233ab4684ea95bdabcb9745e9e50d5a10a62ad23604145ad205ac
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

