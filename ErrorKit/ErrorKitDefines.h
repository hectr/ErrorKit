// ErrorKitDefines.h
//
// Copyright (c) 2013 Héctor Marqués
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#ifndef _ERRORKITDEFINES_H
#define _ERRORKITDEFINES_H

#ifdef ACCOUNTS_EXTERN
#define ERROR_KIT_ACCOUNTS 1
#endif

#define ERROR_KIT_ADDITIONS

#ifdef _AFNETWORKING_
#define ERROR_KIT_AFNETWORKING 1
#endif

#ifdef AVF_EXPORT
#define ERROR_KIT_AVFOUNDATION 1
#endif

#define ERROR_KIT_CORE 1

#ifdef _COREDATADEFINES_H
#define ERROR_KIT_CORE_DATA 1
#endif

#ifdef __CORELOCATION__
#define ERROR_KIT_CORE_LOCATION 1
#endif

#ifdef FB_IOS_SDK_VERSION_STRING
#define ERROR_KIT_FACEBOOK_SDK 1
#endif

#define ERROR_KIT_HTTP 1

#define ERROR_KIT_JSON_KIT 1

#define ERROR_KIT_JSON_VALUES 1

#ifdef MK_EXTERN
#define ERROR_KIT_MAP_KIT 1
#endif

#define ERROR_KIT_NSEXCEPTION 1

#define ERROR_KIT_PARSE 1

#ifdef _SECURITY_SECITEM_H_
#define ERROR_KIT_SECURITY 1
#endif

#ifdef SK_EXTERN
#define ERROR_KIT_STORE_KIT 1
#endif

#ifdef TransitionKit_TransitionKit_h
#define ERROR_KIT_TRANSITION_KIT 1
#endif

#ifdef UIKIT_STATIC_INLINE
#define ERROR_KIT_UI_KIT 1
#define ERROR_KIT_DEFAULT 1
#endif

#endif
