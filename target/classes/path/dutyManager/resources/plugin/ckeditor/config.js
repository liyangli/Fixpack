/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */
CKEDITOR.editorConfig = function( config )   
{   
    config.language = 'zh-cn';   
    config.filebrowserBrowseUrl = '/resources/uploader/browse.jsp';   
    config.filebrowserImageBrowseUrl = '/resources/uploader/browse.jsp?type=Images';   
    config.filebrowserFlashBrowseUrl = '/resources/uploader/browse.jsp?type=Flashs';   
    config.filebrowserUploadUrl = '/resources/uploader/uploadupload.jsp';   
    config.filebrowserImageUploadUrl = '/resources/uploader/upload.jsp?type=Images';   
    config.filebrowserFlashUploadUrl = '/resources/uploader/upload.jsp?type=Flashs';   
    config.filebrowserWindowWidth = '640';   
    config.filebrowserWindowHeight = '480';   
}  