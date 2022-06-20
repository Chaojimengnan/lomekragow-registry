# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF 2b10b71d7cbfb90f1fb7f8d00b77024ca8655ba4 # 0.2.1
    SHA512 c2c9f882578ba914791ac827acf3366a438515c4057e959a350f66c438d690c812d8047aea0cf09173124a091aeebefeb7009e5eeecefd5d634488bcbc388d67
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