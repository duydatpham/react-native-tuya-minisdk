export declare function openNetworkSettings(): any;
export declare type InitActivatorParams = {
    homeId: number;
    ssid: string;
    password: string;
    time: number;
    type: 'TY_EZ' | 'TY_AP' | 'TY_QR';
};
export declare function initActivator(params: InitActivatorParams): Promise<any>;
export declare function stopConfig(): any;
export declare function getCurrentWifi(success: (ssid: string) => void, error: () => void): any;
