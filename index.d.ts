declare module "react-native-id-verify" {
    export default class RNIdVerify {


        /**
         * 获取bizcode
         */
        static getBizcode(): Promise<any>

        /**
         * 开始身份认证
         * @param url 认证url，从商家服务端获得
         * @param certifyId 认证流水号，从商家服务端获得
         */
        static startVerify(url: string, certifyId: string): Promise<any>;
    }
}
