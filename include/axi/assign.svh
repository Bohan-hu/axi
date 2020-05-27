// Copyright (c) 2014-2018 ETH Zurich, University of Bologna
//
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

// Author:
// Andreas Kurth  <akurth@iis.ee.ethz.ch>

// Macros to assign AXI Interfaces and Structs

`ifndef AXI_ASSIGN_SVH_
`define AXI_ASSIGN_SVH_

////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning one AXI4+ATOP interface to another, as if you would do `assign slv = mst;`
//
// The channel assignments `AXI_ASSIGN_XX(dst, src)` assign all payload and the valid signal of the
// `XX` channel from the `src` to the `dst` interface and they assign the ready signal from the
// `src` to the `dst` interface.
// The interface assignment `AXI_ASSIGN(dst, src)` assigns all channels including handshakes as if
// `src` was the master of `dst`.
//
// Usage Example:
// `AXI_ASSIGN(slv, mst)
// `AXI_ASSIGN_AW(dst, src)
// `AXI_ASSIGN_R(dst, src)
`define AXI_ASSIGN_AW(dst, src)           \
  assign dst.aw_id      = src.aw_id;      \
  assign dst.aw_addr    = src.aw_addr;    \
  assign dst.aw_len     = src.aw_len;     \
  assign dst.aw_size    = src.aw_size;    \
  assign dst.aw_burst   = src.aw_burst;   \
  assign dst.aw_lock    = src.aw_lock;    \
  assign dst.aw_cache   = src.aw_cache;   \
  assign dst.aw_prot    = src.aw_prot;    \
  assign dst.aw_qos     = src.aw_qos;     \
  assign dst.aw_region  = src.aw_region;  \
  assign dst.aw_atop    = src.aw_atop;    \
  assign dst.aw_user    = src.aw_user;    \
  assign dst.aw_valid   = src.aw_valid;   \
  assign src.aw_ready   = dst.aw_ready;
`define AXI_ASSIGN_W(dst, src)        \
  assign dst.w_data   = src.w_data;   \
  assign dst.w_strb   = src.w_strb;   \
  assign dst.w_last   = src.w_last;   \
  assign dst.w_user   = src.w_user;   \
  assign dst.w_valid  = src.w_valid;  \
  assign src.w_ready  = dst.w_ready;
`define AXI_ASSIGN_B(dst, src)        \
  assign dst.b_id     = src.b_id;     \
  assign dst.b_resp   = src.b_resp;   \
  assign dst.b_user   = src.b_user;   \
  assign dst.b_valid  = src.b_valid;  \
  assign src.b_ready  = dst.b_ready;
`define AXI_ASSIGN_AR(dst, src)           \
  assign dst.ar_id      = src.ar_id;      \
  assign dst.ar_addr    = src.ar_addr;    \
  assign dst.ar_len     = src.ar_len;     \
  assign dst.ar_size    = src.ar_size;    \
  assign dst.ar_burst   = src.ar_burst;   \
  assign dst.ar_lock    = src.ar_lock;    \
  assign dst.ar_cache   = src.ar_cache;   \
  assign dst.ar_prot    = src.ar_prot;    \
  assign dst.ar_qos     = src.ar_qos;     \
  assign dst.ar_region  = src.ar_region;  \
  assign dst.ar_user    = src.ar_user;    \
  assign dst.ar_valid   = src.ar_valid;   \
  assign src.ar_ready   = dst.ar_ready;
`define AXI_ASSIGN_R(dst, src)        \
  assign dst.r_id     = src.r_id;     \
  assign dst.r_data   = src.r_data;   \
  assign dst.r_resp   = src.r_resp;   \
  assign dst.r_last   = src.r_last;   \
  assign dst.r_user   = src.r_user;   \
  assign dst.r_valid  = src.r_valid;  \
  assign src.r_ready  = dst.r_ready;
`define AXI_ASSIGN(slv, mst)  \
  `AXI_ASSIGN_AW(slv, mst)    \
  `AXI_ASSIGN_W(slv, mst)     \
  `AXI_ASSIGN_B(mst, slv)     \
  `AXI_ASSIGN_AR(slv, mst)    \
  `AXI_ASSIGN_R(mst, slv)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning a AXI4+ATOP interface to a monitor modport, as if you would do `assign mon = axi_if;`
//
// The channel assignment `AXI_ASSIGN_MONITOR(mon_dv, axi_if)` assigns all signals from `axi_if`
// to the `mon_dv` interface.
//
// Usage Example:
// `AXI_ASSIGN_MONITOR(mon_dv, axi_if)
`define AXI_ASSIGN_MONITOR(mon_dv, axi_if)    \
  assign mon_dv.aw_id     = axi_if.aw_id;     \
  assign mon_dv.aw_addr   = axi_if.aw_addr;   \
  assign mon_dv.aw_len    = axi_if.aw_len;    \
  assign mon_dv.aw_size   = axi_if.aw_size;   \
  assign mon_dv.aw_burst  = axi_if.aw_burst;  \
  assign mon_dv.aw_lock   = axi_if.aw_lock;   \
  assign mon_dv.aw_cache  = axi_if.aw_cache;  \
  assign mon_dv.aw_prot   = axi_if.aw_prot;   \
  assign mon_dv.aw_qos    = axi_if.aw_qos;    \
  assign mon_dv.aw_region = axi_if.aw_region; \
  assign mon_dv.aw_atop   = axi_if.aw_atop;   \
  assign mon_dv.aw_user   = axi_if.aw_user;   \
  assign mon_dv.aw_valid  = axi_if.aw_valid;  \
  assign mon_dv.aw_ready  = axi_if.aw_ready;  \
  assign mon_dv.w_data    = axi_if.w_data;    \
  assign mon_dv.w_strb    = axi_if.w_strb;    \
  assign mon_dv.w_last    = axi_if.w_last;    \
  assign mon_dv.w_user    = axi_if.w_user;    \
  assign mon_dv.w_valid   = axi_if.w_valid;   \
  assign mon_dv.w_ready   = axi_if.w_ready;   \
  assign mon_dv.b_id      = axi_if.b_id;      \
  assign mon_dv.b_resp    = axi_if.b_resp;    \
  assign mon_dv.b_user    = axi_if.b_user;    \
  assign mon_dv.b_valid   = axi_if.b_valid;   \
  assign mon_dv.b_ready   = axi_if.b_ready;   \
  assign mon_dv.ar_id     = axi_if.ar_id;     \
  assign mon_dv.ar_addr   = axi_if.ar_addr;   \
  assign mon_dv.ar_len    = axi_if.ar_len;    \
  assign mon_dv.ar_size   = axi_if.ar_size;   \
  assign mon_dv.ar_burst  = axi_if.ar_burst;  \
  assign mon_dv.ar_lock   = axi_if.ar_lock;   \
  assign mon_dv.ar_cache  = axi_if.ar_cache;  \
  assign mon_dv.ar_prot   = axi_if.ar_prot;   \
  assign mon_dv.ar_qos    = axi_if.ar_qos;    \
  assign mon_dv.ar_region = axi_if.ar_region; \
  assign mon_dv.ar_user   = axi_if.ar_user;   \
  assign mon_dv.ar_valid  = axi_if.ar_valid;  \
  assign mon_dv.ar_ready  = axi_if.ar_ready;  \
  assign mon_dv.r_id      = axi_if.r_id;      \
  assign mon_dv.r_data    = axi_if.r_data;    \
  assign mon_dv.r_resp    = axi_if.r_resp;    \
  assign mon_dv.r_last    = axi_if.r_last;    \
  assign mon_dv.r_user    = axi_if.r_user;    \
  assign mon_dv.r_valid   = axi_if.r_valid;   \
  assign mon_dv.r_ready   = axi_if.r_ready;
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Internal implementation for assigning interfaces from structs, allows for standalone assignments
// (with `opt_as = assign`) and assignments inside processes (with `opt_as` void) with the same
// code.
`define AXI_FROM_AW(opt_as, axi_if, aw_struct)  \
  opt_as axi_if.aw_id     = aw_struct.id;       \
  opt_as axi_if.aw_addr   = aw_struct.addr;     \
  opt_as axi_if.aw_len    = aw_struct.len;      \
  opt_as axi_if.aw_size   = aw_struct.size;     \
  opt_as axi_if.aw_burst  = aw_struct.burst;    \
  opt_as axi_if.aw_lock   = aw_struct.lock;     \
  opt_as axi_if.aw_cache  = aw_struct.cache;    \
  opt_as axi_if.aw_prot   = aw_struct.prot;     \
  opt_as axi_if.aw_qos    = aw_struct.qos;      \
  opt_as axi_if.aw_region = aw_struct.region;   \
  opt_as axi_if.aw_atop   = aw_struct.atop;     \
  opt_as axi_if.aw_user   = aw_struct.user;
`define AXI_FROM_W(opt_as, axi_if, w_struct)  \
  opt_as axi_if.w_data  = w_struct.data;      \
  opt_as axi_if.w_strb  = w_struct.strb;      \
  opt_as axi_if.w_last  = w_struct.last;      \
  opt_as axi_if.w_user  = w_struct.user;
`define AXI_FROM_B(opt_as, axi_if, b_struct)  \
  opt_as axi_if.b_id    = b_struct.id;        \
  opt_as axi_if.b_resp  = b_struct.resp;      \
  opt_as axi_if.b_user  = b_struct.user;
`define AXI_FROM_AR(opt_as, axi_if, ar_struct)  \
  opt_as axi_if.ar_id     = ar_struct.id;       \
  opt_as axi_if.ar_addr   = ar_struct.addr;     \
  opt_as axi_if.ar_len    = ar_struct.len;      \
  opt_as axi_if.ar_size   = ar_struct.size;     \
  opt_as axi_if.ar_burst  = ar_struct.burst;    \
  opt_as axi_if.ar_lock   = ar_struct.lock;     \
  opt_as axi_if.ar_cache  = ar_struct.cache;    \
  opt_as axi_if.ar_prot   = ar_struct.prot;     \
  opt_as axi_if.ar_qos    = ar_struct.qos;      \
  opt_as axi_if.ar_region = ar_struct.region;   \
  opt_as axi_if.ar_user   = ar_struct.user;
`define AXI_FROM_R(opt_as, axi_if, r_struct)  \
  opt_as axi_if.r_id    = r_struct.id;        \
  opt_as axi_if.r_data  = r_struct.data;      \
  opt_as axi_if.r_resp  = r_struct.resp;      \
  opt_as axi_if.r_last  = r_struct.last;      \
  opt_as axi_if.r_user  = r_struct.user;
`define AXI_FROM_REQ(opt_as, axi_if, req_struct)  \
  `AXI_FROM_AW(opt_as, axi_if, req_struct.aw)     \
  opt_as axi_if.aw_valid = req_struct.aw_valid;   \
  `AXI_FROM_W(opt_as, axi_if, req_struct.w)       \
  opt_as axi_if.w_valid = req_struct.w_valid;     \
  opt_as axi_if.b_ready = req_struct.b_ready;     \
  `AXI_FROM_AR(opt_as, axi_if, req_struct.ar)     \
  opt_as axi_if.ar_valid = req_struct.ar_valid;   \
  opt_as axi_if.r_ready = req_struct.r_ready;
`define AXI_FROM_RESP(opt_as, axi_if, resp_struct)  \
  opt_as axi_if.aw_ready = resp_struct.aw_ready;    \
  opt_as axi_if.ar_ready = resp_struct.ar_ready;    \
  opt_as axi_if.w_ready = resp_struct.w_ready;      \
  opt_as axi_if.b_valid = resp_struct.b_valid;      \
  `AXI_FROM_B(opt_as, axi_if, resp_struct.b)        \
  opt_as axi_if.r_valid = resp_struct.r_valid;      \
  `AXI_FROM_R(opt_as, axi_if, resp_struct.r)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting an interface from channel or request/response structs inside a process.
//
// The channel macros `AXI_SET_FROM_XX(axi_if, xx_struct)` set the payload signals of the `axi_if`
// interface from the signals in `xx_struct`.  They do not set the handshake signals.
// The request macro `AXI_SET_FROM_REQ(axi_if, req_struct)` sets all request channels (AW, W, AR)
// and the request-side handshake signals (AW, W, and AR valid and B and R ready) of the `axi_if`
// interface from the signals in `req_struct`.
// The response macro `AXI_SET_FROM_RESP(axi_if, resp_struct)` sets both response channels (B and R)
// and the response-side handshake signals (B and R valid and AW, W, and AR ready) of the `axi_if`
// interface from the signals in `resp_struct`.
//
// Usage Example:
// always_comb begin
//   `AXI_SET_FROM_REQ(my_if, my_req_struct)
// end
`define AXI_SET_FROM_AW(axi_if, aw_struct)      `AXI_FROM_AW(, axi_if, aw_struct)
`define AXI_SET_FROM_W(axi_if, w_struct)        `AXI_FROM_W(, axi_if, w_struct)
`define AXI_SET_FROM_B(axi_if, b_struct)        `AXI_FROM_B(, axi_if, b_struct)
`define AXI_SET_FROM_AR(axi_if, ar_struct)      `AXI_FROM_AR(, axi_if, ar_struct)
`define AXI_SET_FROM_R(axi_if, r_struct)        `AXI_FROM_R(, axi_if, r_struct)
`define AXI_SET_FROM_REQ(axi_if, req_struct)    `AXI_FROM_REQ(, axi_if, req_struct)
`define AXI_SET_FROM_RESP(axi_if, resp_struct)  `AXI_FROM_RESP(, axi_if, resp_struct)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning an interface from channel or request/response structs outside a process.
//
// The channel macros `AXI_ASSIGN_FROM_XX(axi_if, xx_struct)` assign the payload signals of the
// `axi_if` interface from the signals in `xx_struct`.  They do not assign the handshake signals.
// The request macro `AXI_ASSIGN_FROM_REQ(axi_if, req_struct)` assigns all request channels (AW, W,
// AR) and the request-side handshake signals (AW, W, and AR valid and B and R ready) of the
// `axi_if` interface from the signals in `req_struct`.
// The response macro `AXI_ASSIGN_FROM_RESP(axi_if, resp_struct)` assigns both response channels (B
// and R) and the response-side handshake signals (B and R valid and AW, W, and AR ready) of the
// `axi_if` interface from the signals in `resp_struct`.
//
// Usage Example:
// `AXI_ASSIGN_FROM_REQ(my_if, my_req_struct)
`define AXI_ASSIGN_FROM_AW(axi_if, aw_struct)     `AXI_FROM_AW(assign, axi_if, aw_struct)
`define AXI_ASSIGN_FROM_W(axi_if, w_struct)       `AXI_FROM_W(assign, axi_if, w_struct)
`define AXI_ASSIGN_FROM_B(axi_if, b_struct)       `AXI_FROM_B(assign, axi_if, b_struct)
`define AXI_ASSIGN_FROM_AR(axi_if, ar_struct)     `AXI_FROM_AR(assign, axi_if, ar_struct)
`define AXI_ASSIGN_FROM_R(axi_if, r_struct)       `AXI_FROM_R(assign, axi_if, r_struct)
`define AXI_ASSIGN_FROM_REQ(axi_if, req_struct)   `AXI_FROM_REQ(assign, axi_if, req_struct)
`define AXI_ASSIGN_FROM_RESP(axi_if, resp_struct) `AXI_FROM_RESP(assign, axi_if, resp_struct)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Internal implementation for assigning to structs from anything (as defined by `__sep`), allows
// for standalone assignments (with `opt_as = assign`) and assignments inside processes (with
// `opt_as` void) with the same code.
`define AXI_TO_AW(__opt_as, __lhs, __rhs, __sep)  \
  __opt_as __lhs = '{                             \
    id:      __rhs``__sep``id,                    \
    addr:    __rhs``__sep``addr,                  \
    len:     __rhs``__sep``len,                   \
    size:    __rhs``__sep``size,                  \
    burst:   __rhs``__sep``burst,                 \
    lock:    __rhs``__sep``lock,                  \
    cache:   __rhs``__sep``cache,                 \
    prot:    __rhs``__sep``prot,                  \
    qos:     __rhs``__sep``qos,                   \
    region:  __rhs``__sep``region,                \
    atop:    __rhs``__sep``atop,                  \
    user:    __rhs``__sep``user                   \
  };
`define AXI_TO_W(__opt_as, __lhs, __rhs, __sep) \
  __opt_as __lhs = '{                           \
    data: __rhs``__sep``data,                   \
    strb: __rhs``__sep``strb,                   \
    last: __rhs``__sep``last,                   \
    user: __rhs``__sep``user                    \
  };
`define AXI_TO_B(__opt_as, __lhs, __rhs, __sep) \
  __opt_as __lhs = '{                           \
    id:   __rhs``__sep``id,                     \
    resp: __rhs``__sep``resp,                   \
    user: __rhs``__sep``user                    \
  };
`define AXI_TO_AR(__opt_as, __lhs, __rhs, __sep)  \
  __opt_as __lhs = '{                             \
    id:      __rhs``__sep``id,                    \
    addr:    __rhs``__sep``addr,                  \
    len:     __rhs``__sep``len,                   \
    size:    __rhs``__sep``size,                  \
    burst:   __rhs``__sep``burst,                 \
    lock:    __rhs``__sep``lock,                  \
    cache:   __rhs``__sep``cache,                 \
    prot:    __rhs``__sep``prot,                  \
    qos:     __rhs``__sep``qos,                   \
    region:  __rhs``__sep``region,                \
    user:    __rhs``__sep``user                   \
  };
`define AXI_TO_R(__opt_as, __lhs, __rhs, __sep) \
  __opt_as __lhs = '{                           \
    id:   __rhs``__sep``id,                     \
    data: __rhs``__sep``data,                   \
    resp: __rhs``__sep``resp,                   \
    last: __rhs``__sep``last,                   \
    user: __rhs``__sep``user                    \
  };
`define AXI_TO_REQ(__opt_as, __lhs, __rhs, __sep) \
  `AXI_TO_AW(__opt_as, __lhs.aw, __rhs.aw, __sep) \
  __opt_as __lhs.aw_valid = __rhs.aw_valid;       \
  `AXI_TO_W(__opt_as, __lhs.w, __rhs.w, __sep)    \
  __opt_as __lhs.w_valid = __rhs.w_valid;         \
  __opt_as __lhs.b_ready = __rhs.b_ready;         \
  `AXI_TO_AR(__opt_as, __lhs.ar, __rhs.ar, __sep) \
  __opt_as __lhs.ar_valid = __rhs.ar_valid;       \
  __opt_as __lhs.r_ready = __rhs.r_ready;
`define AXI_TO_RESP(__opt_as, __lhs, __rhs, __sep)  \
  __opt_as __lhs.aw_ready = __rhs.aw_ready;         \
  __opt_as __lhs.ar_ready = __rhs.ar_ready;         \
  __opt_as __lhs.w_ready = __rhs.w_ready;           \
  __opt_as __lhs.b_valid = __rhs.b_valid;           \
  `AXI_TO_B(__opt_as, __lhs.b, __rhs.b, __sep)      \
  __opt_as __lhs.r_valid = __rhs.r_valid;           \
  `AXI_TO_R(__opt_as, __lhs.r, __rhs.r, __sep)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting channel or request/response structs from an interface inside a process.
//
// The channel macros `AXI_SET_TO_XX(xx_struct, axi_if)` set the signals of `xx_struct` to the
// payload signals of that channel in the `axi_if` interface.  They do not set the handshake
// signals.
// The request macro `AXI_SET_TO_REQ(axi_if, req_struct)` sets all signals of `req_struct` (i.e.,
// request channel (AW, W, AR) payload and request-side handshake signals (AW, W, and AR valid and
// B and R ready)) to the signals in the `axi_if` interface.
// The response macro `AXI_SET_TO_RESP(axi_if, resp_struct)` sets all signals of `resp_struct`
// (i.e., response channel (B and R) payload and response-side handshake signals (B and R valid and
// AW, W, and AR ready)) to the signals in the `axi_if` interface.
//
// Usage Example:
// always_comb begin
//   `AXI_SET_TO_REQ(my_req_struct, my_if)
// end
`define AXI_SET_TO_AW(aw_struct, axi_if)     `AXI_TO_AW(, aw_struct, axi_if.aw, _)
`define AXI_SET_TO_W(w_struct, axi_if)       `AXI_TO_W(, w_struct, axi_if.w, _)
`define AXI_SET_TO_B(b_struct, axi_if)       `AXI_TO_B(, b_struct, axi_if.b, _)
`define AXI_SET_TO_AR(ar_struct, axi_if)     `AXI_TO_AR(, ar_struct, axi_if.ar, _)
`define AXI_SET_TO_R(r_struct, axi_if)       `AXI_TO_R(, r_struct, axi_if.r, _)
`define AXI_SET_TO_REQ(req_struct, axi_if)   `AXI_TO_REQ(, req_struct, axi_if, _)
`define AXI_SET_TO_RESP(resp_struct, axi_if) `AXI_TO_RESP(, resp_struct, axi_if, _)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning channel or request/response structs from an interface outside a process.
//
// The channel macros `AXI_ASSIGN_TO_XX(xx_struct, axi_if)` assign the signals of `xx_struct` to the
// payload signals of that channel in the `axi_if` interface.  They do not assign the handshake
// signals.
// The request macro `AXI_ASSIGN_TO_REQ(axi_if, req_struct)` assigns all signals of `req_struct`
// (i.e., request channel (AW, W, AR) payload and request-side handshake signals (AW, W, and AR
// valid and B and R ready)) to the signals in the `axi_if` interface.
// The response macro `AXI_ASSIGN_TO_RESP(axi_if, resp_struct)` assigns all signals of `resp_struct`
// (i.e., response channel (B and R) payload and response-side handshake signals (B and R valid and
// AW, W, and AR ready)) to the signals in the `axi_if` interface.
//
// Usage Example:
// `AXI_ASSIGN_TO_REQ(my_req_struct, my_if)
`define AXI_ASSIGN_TO_AW(aw_struct, axi_if)     `AXI_TO_AW(assign, aw_struct, axi_if.aw, _)
`define AXI_ASSIGN_TO_W(w_struct, axi_if)       `AXI_TO_W(assign, w_struct, axi_if.w, _)
`define AXI_ASSIGN_TO_B(b_struct, axi_if)       `AXI_TO_B(assign, b_struct, axi_if.b, _)
`define AXI_ASSIGN_TO_AR(ar_struct, axi_if)     `AXI_TO_AR(assign, ar_struct, axi_if.ar, _)
`define AXI_ASSIGN_TO_R(r_struct, axi_if)       `AXI_TO_R(assign, r_struct, axi_if.r, _)
`define AXI_ASSIGN_TO_REQ(req_struct, axi_if)   `AXI_TO_REQ(assign, req_struct, axi_if, _)
`define AXI_ASSIGN_TO_RESP(resp_struct, axi_if) `AXI_TO_RESP(assign, resp_struct, axi_if, _)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting channel or request/response structs from another struct inside a process.
//
// The channel macros `AXI_SET_XX_STRUCT(lhs, rhs)` set the fields of the `lhs` channel struct to
// the fields of the `rhs` channel struct.  They do not set the handshake signals, which are not
// part of channel structs.
// The request macro `AXI_SET_REQ_STRUCT(lhs, rhs)` sets all fields of the `lhs` request struct to
// the fields of the `rhs` request struct.  This includes all request channel (AW, W, AR) payload
// and request-side handshake signals (AW, W, and AR valid and B and R ready).
// The response macro `AXI_SET_RESP_STRUCT(lhs, rhs)` sets all fields of the `lhs` response struct
// to the fields of the `rhs` response struct.  This includes all response channel (B and R) payload
// and response-side handshake signals (B and R valid and AW, W, and R ready).
//
// Usage Example:
// always_comb begin
//   `AXI_SET_REQ_STRUCT(my_req_struct, another_req_struct)
// end
`define AXI_SET_AW_STRUCT(lhs, rhs)     `AXI_TO_AW(, lhs, rhs, .)
`define AXI_SET_W_STRUCT(lhs, rhs)       `AXI_TO_W(, lhs, rhs, .)
`define AXI_SET_B_STRUCT(lhs, rhs)       `AXI_TO_B(, lhs, rhs, .)
`define AXI_SET_AR_STRUCT(lhs, rhs)     `AXI_TO_AR(, lhs, rhs, .)
`define AXI_SET_R_STRUCT(lhs, rhs)       `AXI_TO_R(, lhs, rhs, .)
`define AXI_SET_REQ_STRUCT(lhs, rhs)   `AXI_TO_REQ(, lhs, rhs, .)
`define AXI_SET_RESP_STRUCT(lhs, rhs) `AXI_TO_RESP(, lhs, rhs, .)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning channel or request/response structs from another struct outside a process.
//
// The channel macros `AXI_ASSIGN_XX_STRUCT(lhs, rhs)` assign the fields of the `lhs` channel struct
// to the fields of the `rhs` channel struct.  They do not assign the handshake signals, which are
// not part of the channel structs.
// The request macro `AXI_ASSIGN_REQ_STRUCT(lhs, rhs)` assigns all fields of the `lhs` request
// struct to the fields of the `rhs` request struct.  This includes all request channel (AW, W, AR)
// payload and request-side handshake signals (AW, W, and AR valid and B and R ready).
// The response macro `AXI_ASSIGN_RESP_STRUCT(lhs, rhs)` assigns all fields of the `lhs` response
// struct to the fields of the `rhs` response struct.  This includes all response channel (B and R)
// payload and response-side handshake signals (B and R valid and AW, W, and R ready).
//
// Usage Example:
// `AXI_ASSIGN_REQ_STRUCT(my_req_struct, another_req_struct)
`define AXI_ASSIGN_AW_STRUCT(lhs, rhs)     `AXI_TO_AW(assign, lhs, rhs, .)
`define AXI_ASSIGN_W_STRUCT(lhs, rhs)       `AXI_TO_W(assign, lhs, rhs, .)
`define AXI_ASSIGN_B_STRUCT(lhs, rhs)       `AXI_TO_B(assign, lhs, rhs, .)
`define AXI_ASSIGN_AR_STRUCT(lhs, rhs)     `AXI_TO_AR(assign, lhs, rhs, .)
`define AXI_ASSIGN_R_STRUCT(lhs, rhs)       `AXI_TO_R(assign, lhs, rhs, .)
`define AXI_ASSIGN_REQ_STRUCT(lhs, rhs)   `AXI_TO_REQ(assign, lhs, rhs, .)
`define AXI_ASSIGN_RESP_STRUCT(lhs, rhs) `AXI_TO_RESP(assign, lhs, rhs, .)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning one AXI-Lite interface to another, as if you would do `assign slv = mst;`
//
// The channel assignments `AXI_LITE_ASSIGN_XX(dst, src)` assign all payload and the valid signal of
// the `XX` channel from the `src` to the `dst` interface and they assign the ready signal from the
// `src` to the `dst` interface.
// The interface assignment `AXI_LITE_ASSIGN(dst, src)` assigns all channels including handshakes as
// if `src` was the master of `dst`.
//
// Usage Example:
// `AXI_LITE_ASSIGN(slv, mst)
// `AXI_LITE_ASSIGN_AW(dst, src)
// `AXI_LITE_ASSIGN_R(dst, src)
`define AXI_LITE_ASSIGN_AW(dst, src)  \
  assign dst.aw_addr  = src.aw_addr;  \
  assign dst.aw_prot  = src.aw_prot;  \
  assign dst.aw_valid = src.aw_valid; \
  assign src.aw_ready = dst.aw_ready;
`define AXI_LITE_ASSIGN_W(dst, src)   \
  assign dst.w_data   = src.w_data;   \
  assign dst.w_strb   = src.w_strb;   \
  assign dst.w_valid  = src.w_valid;  \
  assign src.w_ready  = dst.w_ready;
`define AXI_LITE_ASSIGN_B(dst, src)   \
  assign dst.b_resp   = src.b_resp;   \
  assign dst.b_valid  = src.b_valid;  \
  assign src.b_ready  = dst.b_ready;
`define AXI_LITE_ASSIGN_AR(dst, src)  \
  assign dst.ar_addr  = src.ar_addr;  \
  assign dst.ar_prot  = src.ar_prot;  \
  assign dst.ar_valid = src.ar_valid; \
  assign src.ar_ready = dst.ar_ready;
`define AXI_LITE_ASSIGN_R(dst, src)   \
  assign dst.r_data   = src.r_data;   \
  assign dst.r_resp   = src.r_resp;   \
  assign dst.r_valid  = src.r_valid;  \
  assign src.r_ready  = dst.r_ready;
`define AXI_LITE_ASSIGN(slv, mst) \
  `AXI_LITE_ASSIGN_AW(slv, mst)   \
  `AXI_LITE_ASSIGN_W(slv, mst)    \
  `AXI_LITE_ASSIGN_B(mst, slv)    \
  `AXI_LITE_ASSIGN_AR(slv, mst)   \
  `AXI_LITE_ASSIGN_R(mst, slv)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Internal implementation for assigning Lite interfaces from structs, allows for standalone
// assignments (with `opt_as = assign`) and assignments inside processes (with `opt_as` void) with
// the same code.
`define AXI_LITE_FROM_AW(opt_as, axi_lite_if, aw_lite_struct) \
  opt_as axi_lite_if.aw_addr = aw_lite_struct.addr;           \
  opt_as axi_lite_if.aw_prot = aw_lite_struct.prot;
`define AXI_LITE_FROM_W(opt_as, axi_lite_if, w_lite_struct)  \
  opt_as axi_lite_if.w_data = w_lite_struct.data;            \
  opt_as axi_lite_if.w_strb = w_lite_struct.strb;
`define AXI_LITE_FROM_B(opt_as, axi_lite_if, b_lite_struct) \
  opt_as axi_lite_if.b_resp = b_lite_struct.resp;
`define AXI_LITE_FROM_AR(opt_as, axi_lite_if, ar_lite_struct) \
  opt_as axi_lite_if.ar_addr = ar_lite_struct.addr;           \
  opt_as axi_lite_if.ar_prot = ar_lite_struct.prot;
`define AXI_LITE_FROM_R(opt_as, axi_lite_if, r_lite_struct) \
  opt_as axi_lite_if.r_data  = r_lite_struct.data;          \
  opt_as axi_lite_if.r_resp  = r_lite_struct.resp;
`define AXI_LITE_FROM_REQ(opt_as, axi_lite_if, req_lite_struct) \
  `AXI_LITE_FROM_AW(opt_as, axi_lite_if, req_lite_struct.aw)    \
  opt_as axi_lite_if.aw_valid = req_lite_struct.aw_valid;       \
  `AXI_LITE_FROM_W(opt_as, axi_lite_if, req_lite_struct.w)      \
  opt_as axi_lite_if.w_valid = req_lite_struct.w_valid;         \
  opt_as axi_lite_if.b_ready = req_lite_struct.b_ready;         \
  `AXI_LITE_FROM_AR(opt_as, axi_lite_if, req_lite_struct.ar)    \
  opt_as axi_lite_if.ar_valid = req_lite_struct.ar_valid;       \
  opt_as axi_lite_if.r_ready = req_lite_struct.r_ready;
`define AXI_LITE_FROM_RESP(opt_as, axi_lite_if, resp_lite_struct) \
  opt_as axi_lite_if.aw_ready = resp_lite_struct.aw_ready;        \
  opt_as axi_lite_if.ar_ready = resp_lite_struct.ar_ready;        \
  opt_as axi_lite_if.w_ready = resp_lite_struct.w_ready;          \
  opt_as axi_lite_if.b_valid = resp_lite_struct.b_valid;          \
  `AXI_LITE_FROM_B(opt_as, axi_lite_if, resp_lite_struct.b)       \
  opt_as axi_lite_if.r_valid = resp_lite_struct.r_valid;          \
  `AXI_LITE_FROM_R(opt_as, axi_lite_if, resp_lite_struct.r)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting a Lite interface from channel or request/response structs inside a process.
//
// The channel macros `AXI_LITE_SET_FROM_XX(axi_if, xx_struct)` set the payload signals of the
// `axi_if` interface from the signals in `xx_struct`.  They do not set the handshake signals.
// The request macro `AXI_LITE_SET_FROM_REQ(axi_if, req_struct)` sets all request channels (AW, W,
// AR) and the request-side handshake signals (AW, W, and AR valid and B and R ready) of the
// `axi_if` interface from the signals in `req_struct`.
// The response macro `AXI_LITE_SET_FROM_RESP(axi_if, resp_struct)` sets both response channels (B
// and R) and the response-side handshake signals (B and R valid and AW, W, and AR ready) of the
// `axi_if` interface from the signals in `resp_struct`.
//
// Usage Example:
// always_comb begin
//   `AXI_LITE_SET_FROM_REQ(my_if, my_req_struct)
// end
`define AXI_LITE_SET_FROM_AW(axi_if, aw_struct)      `AXI_LITE_FROM_AW(, axi_if, aw_struct)
`define AXI_LITE_SET_FROM_W(axi_if, w_struct)        `AXI_LITE_FROM_W(, axi_if, w_struct)
`define AXI_LITE_SET_FROM_B(axi_if, b_struct)        `AXI_LITE_FROM_B(, axi_if, b_struct)
`define AXI_LITE_SET_FROM_AR(axi_if, ar_struct)      `AXI_LITE_FROM_AR(, axi_if, ar_struct)
`define AXI_LITE_SET_FROM_R(axi_if, r_struct)        `AXI_LITE_FROM_R(, axi_if, r_struct)
`define AXI_LITE_SET_FROM_REQ(axi_if, req_struct)    `AXI_LITE_FROM_REQ(, axi_if, req_struct)
`define AXI_LITE_SET_FROM_RESP(axi_if, resp_struct)  `AXI_LITE_FROM_RESP(, axi_if, resp_struct)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning a Lite interface from channel or request/response structs outside a process.
//
// The channel macros `AXI_LITE_ASSIGN_FROM_XX(axi_if, xx_struct)` assign the payload signals of the
// `axi_if` interface from the signals in `xx_struct`.  They do not assign the handshake signals.
// The request macro `AXI_LITE_ASSIGN_FROM_REQ(axi_if, req_struct)` assigns all request channels
// (AW, W, AR) and the request-side handshake signals (AW, W, and AR valid and B and R ready) of the
// `axi_if` interface from the signals in `req_struct`.
// The response macro `AXI_LITE_ASSIGN_FROM_RESP(axi_if, resp_struct)` assigns both response
// channels (B and R) and the response-side handshake signals (B and R valid and AW, W, and AR
// ready) of the `axi_if` interface from the signals in `resp_struct`.
//
// Usage Example:
// `AXI_LITE_ASSIGN_FROM_REQ(my_if, my_req_struct)
`define AXI_LITE_ASSIGN_FROM_AW(axi_if, aw_struct)     `AXI_LITE_FROM_AW(assign, axi_if, aw_struct)
`define AXI_LITE_ASSIGN_FROM_W(axi_if, w_struct)       `AXI_LITE_FROM_W(assign, axi_if, w_struct)
`define AXI_LITE_ASSIGN_FROM_B(axi_if, b_struct)       `AXI_LITE_FROM_B(assign, axi_if, b_struct)
`define AXI_LITE_ASSIGN_FROM_AR(axi_if, ar_struct)     `AXI_LITE_FROM_AR(assign, axi_if, ar_struct)
`define AXI_LITE_ASSIGN_FROM_R(axi_if, r_struct)       `AXI_LITE_FROM_R(assign, axi_if, r_struct)
`define AXI_LITE_ASSIGN_FROM_REQ(axi_if, req_struct)   `AXI_LITE_FROM_REQ(assign, axi_if, req_struct)
`define AXI_LITE_ASSIGN_FROM_RESP(axi_if, resp_struct) `AXI_LITE_FROM_RESP(assign, axi_if, resp_struct)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Internal implementation for assigning to Lite structs from interfaces, allows for standalone
// assignments (with `opt_as = assign`) and assignments inside processes (with `opt_as` void) with
// the same code.
`define AXI_LITE_TO_AW(opt_as, aw_lite_struct, axi_lite_if) \
  opt_as aw_lite_struct = '{                                \
    addr: axi_lite_if.aw_addr,                              \
    prot: axi_lite_if.aw_prot                               \
  };
  // prot not in interface!
`define AXI_LITE_TO_W(opt_as, w_lite_struct, axi_lite_if) \
  opt_as w_lite_struct = '{                               \
    data: axi_lite_if.w_data,                             \
    strb: axi_lite_if.w_strb                              \
  };
`define AXI_LITE_TO_B(opt_as, b_lite_struct, axi_lite_if) \
  opt_as b_lite_struct = '{                               \
    resp: axi_lite_if.b_resp                              \
  };
`define AXI_LITE_TO_AR(opt_as, ar_lite_struct, axi_lite_if) \
  opt_as ar_lite_struct = '{                                \
    addr: axi_lite_if.ar_addr,                              \
    prot: axi_lite_if.ar_prot                               \
  };
`define AXI_LITE_TO_R(opt_as, r_lite_struct, axi_lite_if) \
  opt_as r_lite_struct = '{                               \
    data: axi_lite_if.r_data,                             \
    resp: axi_lite_if.r_resp                              \
  };
`define AXI_LITE_TO_REQ(opt_as, req_lite_struct, axi_lite_if) \
  `AXI_LITE_TO_AW(opt_as, req_lite_struct.aw, axi_lite_if)    \
  opt_as req_lite_struct.aw_valid = axi_lite_if.aw_valid;     \
  `AXI_LITE_TO_W(opt_as, req_lite_struct.w, axi_lite_if)      \
  opt_as req_lite_struct.w_valid = axi_lite_if.w_valid;       \
  opt_as req_lite_struct.b_ready = axi_lite_if.b_ready;       \
  `AXI_LITE_TO_AR(opt_as, req_lite_struct.ar, axi_lite_if)    \
  opt_as req_lite_struct.ar_valid = axi_lite_if.ar_valid;     \
  opt_as req_lite_struct.r_ready = axi_lite_if.r_ready;
`define AXI_LITE_TO_RESP(opt_as, resp_lite_struct, axi_lite_if) \
  opt_as resp_lite_struct.aw_ready = axi_lite_if.aw_ready;      \
  opt_as resp_lite_struct.ar_ready = axi_lite_if.ar_ready;      \
  opt_as resp_lite_struct.w_ready = axi_lite_if.w_ready;        \
  opt_as resp_lite_struct.b_valid = axi_lite_if.b_valid;        \
  `AXI_LITE_TO_B(opt_as, resp_lite_struct.b, axi_lite_if)       \
  opt_as resp_lite_struct.r_valid = axi_lite_if.r_valid;        \
  `AXI_LITE_TO_R(opt_as, resp_lite_struct.r, axi_lite_if)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting channel or request/response structs from an interface inside a process.
//
// The channel macros `AXI_LITE_SET_TO_XX(xx_struct, axi_if)` set the signals of `xx_struct` to the
// payload signals of that channel in the `axi_if` interface.  They do not set the handshake
// signals.
// The request macro `AXI_LITE_SET_TO_REQ(axi_if, req_struct)` sets all signals of `req_struct`
// (i.e., request channel (AW, W, AR) payload and request-side handshake signals (AW, W, and AR
// valid and B and R ready)) to the signals in the `axi_if` interface.
// The response macro `AXI_LITE_SET_TO_RESP(axi_if, resp_struct)` sets all signals of `resp_struct`
// (i.e., response channel (B and R) payload and response-side handshake signals (B and R valid and
// AW, W, and AR ready)) to the signals in the `axi_if` interface.
//
// Usage Example:
// always_comb begin
//   `AXI_LITE_SET_TO_REQ(my_req_struct, my_if)
// end
`define AXI_LITE_SET_TO_AW(aw_struct, axi_if)     `AXI_LITE_TO_AW(, aw_struct, axi_if)
`define AXI_LITE_SET_TO_W(w_struct, axi_if)       `AXI_LITE_TO_W(, w_struct, axi_if)
`define AXI_LITE_SET_TO_B(b_struct, axi_if)       `AXI_LITE_TO_B(, b_struct, axi_if)
`define AXI_LITE_SET_TO_AR(ar_struct, axi_if)     `AXI_LITE_TO_AR(, ar_struct, axi_if)
`define AXI_LITE_SET_TO_R(r_struct, axi_if)       `AXI_LITE_TO_R(, r_struct, axi_if)
`define AXI_LITE_SET_TO_REQ(req_struct, axi_if)   `AXI_LITE_TO_REQ(, req_struct, axi_if)
`define AXI_LITE_SET_TO_RESP(resp_struct, axi_if) `AXI_LITE_TO_RESP(, resp_struct, axi_if)
////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// Assigning channel or request/response structs from an interface outside a process.
//
// The channel macros `AXI_LITE_ASSIGN_TO_XX(xx_struct, axi_if)` assign the signals of `xx_struct`
// to the payload signals of that channel in the `axi_if` interface.  They do not assign the
// handshake signals.
// The request macro `AXI_LITE_ASSIGN_TO_REQ(axi_if, req_struct)` assigns all signals of
// `req_struct` (i.e., request channel (AW, W, AR) payload and request-side handshake signals (AW,
// W, and AR valid and B and R ready)) to the signals in the `axi_if` interface.
// The response macro `AXI_LITE_ASSIGN_TO_RESP(axi_if, resp_struct)` assigns all signals of
// `resp_struct` (i.e., response channel (B and R) payload and response-side handshake signals (B
// and R valid and AW, W, and AR ready)) to the signals in the `axi_if` interface.
//
// Usage Example:
// `AXI_LITE_ASSIGN_TO_REQ(my_req_struct, my_if)
`define AXI_LITE_ASSIGN_TO_AW(aw_struct, axi_if)     `AXI_LITE_TO_AW(assign, aw_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_W(w_struct, axi_if)       `AXI_LITE_TO_W(assign, w_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_B(b_struct, axi_if)       `AXI_LITE_TO_B(assign, b_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_AR(ar_struct, axi_if)     `AXI_LITE_TO_AR(assign, ar_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_R(r_struct, axi_if)       `AXI_LITE_TO_R(assign, r_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_REQ(req_struct, axi_if)   `AXI_LITE_TO_REQ(assign, req_struct, axi_if)
`define AXI_LITE_ASSIGN_TO_RESP(resp_struct, axi_if) `AXI_LITE_TO_RESP(assign, resp_struct, axi_if)
////////////////////////////////////////////////////////////////////////////////////////////////////


`endif
