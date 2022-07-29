# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 00c10b3d1eea221c0d0418e993b974a51a2f4d55 # 0.2.4
    SHA512 21b1678a7db9038734cbf1472e1ea1b9916a3580acbf8de35296cba73b91f0dd2e63d2b43432077f36cd3f7d765d9f30a97eeffe8fb9597bbc40771bb3d87600
    HEAD_REF master
)

# 将我们自己的CMakeLists.txt复制到目录，因为这个是特别为vcpkg准备的
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

# 配置cmake
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

# 构建并安装
vcpkg_install_cmake()

# 修正配置文件
vcpkg_fixup_cmake_targets()

# 生成的库分为debug和release，但是头文件仅需要保留一份，所以删除debug/include
# 又由于这是一个仅头文件库，所以不需要debug，所以直接删除
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)

# 复制usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")