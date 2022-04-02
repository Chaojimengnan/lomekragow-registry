# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/loerr
    REF 73510ce2e1c2ee42848a47f3f4c02d0d2f0b79d3 # 0.0.1
    SHA512 80df50fb83f9f34d8033bad4f5333337b18dffd233006132122bb50c7a010fbe073ea57e90dec42b3b75a8af2703c581572a937baabb2e574ea9ad3bbf486979
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/loerr RENAME copyright)
# vcpkg_copy_pdbs()

