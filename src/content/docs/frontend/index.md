---
title: 'Front-end Development'
weight: 20
---

Front-end development in ArozOS is no different from normal WebApp development. 

## Basics of ArozOS WebApp

ArozOS can be accessed via many different ways. The most noticeable one of course is the web desktop interface. Here is a list of possible access mode of any WebApp installed on ArozOS

- Web Desktop Mode (float windows)
- Mobile Desktop Mode (Vertical full screen float windows)
- Standalone mode (Normal website like)
- PWA Mode (Android devices only)

The front-end API works on the web desktop and mobile desktop mode, while providing limited support to standalone and PWA mode users.

If your functions only require basic web hosting to work  (e.g. static website with all client side processing, like a web calculator) , then you can just import your WebApp into ArozOS and add an ```init.agi``` file. See [init.agi](../init-agi/) for more information.

### Design Style

The default css used for ArozOS is the Semantic UI css framework. However, you can also pick forked projects of semantics like the [Fomantic](https://fomantic-ui.com/) or [Tocas UI v2](https://v2.tocas-ui.com/).

### Use of CDNs

**DO NOT USE CDN LINKS IN AROZOS!!!**

**DO NOT USE CDN LINKS IN AROZOS!!!**

**DO NOT USE CDN LINKS IN AROZOS!!!**

ArozOS is designed to run completely off-grid. If special css or scripts are needed, download them from the source or CDN (remember to trace the internal imported scripts as well) and put them in a local folder within your WebApp's root directory.



